import 'dart:convert';

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:fun_wanandroid/entity/article_entity.dart';
import 'package:fun_wanandroid/http/api.dart';
import 'package:fun_wanandroid/http/apiUtil.dart';
import 'package:fun_wanandroid/entity/three_entity.dart';
import 'package:fun_wanandroid/item/homeItem.dart';
import 'package:fun_wanandroid/pages/web_page.dart';
import 'package:fun_wanandroid/utils/logUtil.dart';

class ThreeDetailsPage extends StatefulWidget {
  final int panelIndex;

  final int index;

  const ThreeDetailsPage({super.key, required this.panelIndex, required this.index});

  @override
  State<StatefulWidget> createState() {
    return _ThreeDetailsPageState();
  }
}

class _ThreeDetailsPageState extends State<ThreeDetailsPage> with TickerProviderStateMixin {
  late EasyRefreshController _refreshController;
  late TabController _controller;

  List<TreeEntityData> treeData = [];
  int _currentIndex = -1;
  String _title = "标题";

  @override
  void initState() {
    super.initState();
    _refreshController = EasyRefreshController();
    _controller = TabController(length: 0, vsync: this);
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(_title),
        bottom: TabBar(
          controller: _controller,
          labelColor: Colors.white,
          labelStyle: const TextStyle(fontSize: 16),
          unselectedLabelColor: Colors.white60,
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          indicatorColor: Colors.white,
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: treeData.map((TreeEntityData data) {
            return Tab(text: data.name);
          }).toList(),
          onTap: (int index) {},
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: treeData.map((TreeEntityData data) {
          return EasyRefresh(
              header: const TaurusHeader(),
              footer: const TaurusFooter(),
              onRefresh: () async {
                data.page = 0;
                getDetails();
              },
              onLoad: () async {
                data.page += 1;
                getDetails();
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(childCount: data.articleList.length, (context, index) {
                    return HomeItem(
                        index: index,
                        item: data.articleList[index],
                        onTop: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return WebPage(title: data.articleList[index].title, url: data.articleList[index].link);
                            },
                          ));
                        },
                        onPressed: () {
                          setState(() {
                            data.articleList[index].collect = !data.articleList[index].collect;
                          });
                        });
                  }))
                ],
              ));
        }).toList(),
      ),
    );
  }

  Future getHttp() async {
    var response = await ApiUtil.getInstance().get(Api.TREE);
    Map<String, dynamic> map = json.decode(response.toString());
    var data = TreeEntity.fromJson(map);
    setState(() {
      treeData = data.getData();
      _title = treeData[widget.panelIndex].name;
      _controller = TabController(length: treeData.length, vsync: this);
      _currentIndex = _currentIndex == -1 ? widget.index : _currentIndex;
    });
    _controller.addListener(_onTopChanged);
    getDetails();
  }

  void getDetails() async {
    TreeEntityData treeEntity = treeData[_controller.index];
    var data = {"cid": treeEntity.id};
    var detailsResponse = await ApiUtil.getInstance().get("${Api.ARTICLE_LIST}${treeEntity.page}/json", data: data);
    Map<String, dynamic> map = json.decode(detailsResponse.toString());
    var articleData = ArticleEntity.fromJson(map);
    setState(() {
      if (treeEntity.articleList.isEmpty) {
        treeEntity.articleList = articleData.getData().datas;
      } else {
        treeEntity.articleList.addAll(articleData.getData().datas);
      }
    });
  }

  _onTopChanged() {
    getDetails();
    setState(() {
      _title = treeData[_controller.index].name;
    });
  }
}
