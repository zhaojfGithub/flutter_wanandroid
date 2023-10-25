import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_swipe/flutter_swipe.dart';

import 'package:fun_wanandroid/http/api.dart';
import 'package:fun_wanandroid/http/apiUtil.dart';
import 'package:fun_wanandroid/item/homeItem.dart';
import 'package:fun_wanandroid/pages/web_page.dart';
import 'package:fun_wanandroid/utils/logUtil.dart';

import '../entity/article_entity.dart';
import '../entity/banner_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState(){
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  List<BannerEntityData> bannerData = [];

  List<ArticleEntityDataDatas> articleData = [];

  late EasyRefreshController _easyRefreshController;
  late SwiperController _swiperController;

  late int _page = 0;
  bool hasMore = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _easyRefreshController = EasyRefreshController(
        controlFinishRefresh: true, controlFinishLoad: true);
    _swiperController = SwiperController();
    if (bannerData.isEmpty && articleData.isEmpty) {
      getHttp();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: EasyRefresh.builder(
        controller: _easyRefreshController,
        header: PhoenixHeader(
            skyColor: Theme.of(context).primaryColor,
            position: IndicatorPosition.locator,
            safeArea: false),
        footer: PhoenixFooter(
          skyColor: Theme.of(context).primaryColor,
          position: IndicatorPosition.locator,
        ),
        onRefresh: retrofit,
        onLoad: loadData,
        childBuilder: (context, physics) {
          return CustomScrollView(
            physics: physics,
            slivers: [
              SliverAppBar(
                backgroundColor: Theme.of(context).primaryColor,
                expandedHeight:
                    MediaQuery.of(context).size.width / 1.8 * 0.8 + 20,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: getBanner(),
                ),
              ),
              const HeaderLocator.sliver(),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return HomeItem(
                      index: index,
                      item: articleData[index],
                      onTop: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) {
                          return WebPage(title: articleData[index].title,url: articleData[index].link);
                        },));
                      },
                      onPressed: () {
                        setState(() {
                          articleData[index].collect =
                              !articleData[index].collect;
                        });
                      });
                }, childCount: articleData.length),
              ),
              const FooterLocator.sliver()
            ],
          );
        },
      ),
    );
  }

  Widget? getBanner() {
    if (bannerData.isEmpty) {
      return null;
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 1.8 * 0.8,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Swiper(
        itemCount: bannerData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: NetworkImage(bannerData[index].imagePath),
                    fit: BoxFit.fill)),
          );
        },
        loop: true,
        autoplay: false,
        autoplayDelay: 3000,
        autoplayDisableOnInteraction: true,
        duration: 600,
        controller: _swiperController,
        pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(size: 3, activeSize: 5)),
        viewportFraction: 0.8,
        scale: 0.9,
        onTap: (int index) {
          LogUtil.log("点击图片 index = $index");
        },
      ),
    );
  }

  void retrofit() async {
    ///延迟  类似 delay
    await Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _page = 0;
      });
      getHttp();
      _easyRefreshController.finishRefresh();
      _easyRefreshController.resetFooter();
    });
  }

  void loadData() async {
    await Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) {
        return;
      }
      setState(() {
        _page++;
      });
      getMoreData();
      _easyRefreshController.finishLoad(
          hasMore ? IndicatorResult.success : IndicatorResult.noMore);
    });
  }

  void getHttp() async {
    try {
      EasyLoading.show();
      var bannerResponse = await ApiUtil.getInstance().get(Api.BANNER);
      Map<String, dynamic> bannerMap = json.decode(bannerResponse.toString());
      var bannerData = BannerEntity.fromJson(bannerMap).getData();

      var articleResponse =
          await ApiUtil.getInstance().get("${Api.ARTICLE_LIST}$_page/json");
      Map<String, dynamic> articleMap = json.decode(articleResponse.toString());
      var articleData = ArticleEntity.fromJson(articleMap).getData().datas;

      setState(() {
        this.bannerData = bannerData;
        this.articleData = articleData;
      });
      _swiperController.startAutoplay();
      EasyLoading.dismiss();
    } catch (e) {
      LogUtil.log(e.toString());
    }
  }

  @override
  void dispose() {
    _easyRefreshController.dispose();
    _swiperController.stopAutoplay();
    _swiperController.dispose();
    super.dispose();
  }

  Future getMoreData() async {
    var articleResponse =
        await ApiUtil.getInstance().get("${Api.ARTICLE_LIST}$_page/json");
    Map<String, dynamic> articleMap = json.decode(articleResponse.toString());
    var entity = ArticleEntity.fromJson(articleMap);
    setState(() {
      articleData.addAll(entity.getData().datas);
      if (entity.getData().datas.length < 10) {
        hasMore = false;
      }
    });
  }
}
