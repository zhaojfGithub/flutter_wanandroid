import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fun_wanandroid/http/apiUtil.dart';
import 'package:fun_wanandroid/utils/logUtil.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../entity/navigation_entity.dart';
import '../http/api.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NavigationState();
  }
}

class _NavigationState extends State<NavigationPage> with AutomaticKeepAliveClientMixin{
  late AutoScrollController _scrollController;

  List<NavigationEntityData> boxList = [];

  List<dynamic> itemList = [];

  NavigationEntityData? selectItem;

  @override
  void initState() {
    super.initState();
    _scrollController = AutoScrollController();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
              flex: 3,
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: boxList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return getBoxItem(boxList[index], () {
                      //滑动右侧Item到指定位置
                      setState(() {
                        selectItem = boxList[index];
                      });
                      _scrollController.scrollToIndex(index);
                    });
                  })),
          Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: boxList.length,
                  itemBuilder: (context,index){
                    return AutoScrollTag(
                      key: ValueKey(index), 
                      controller: _scrollController, 
                      index: index,
                      child: getItem(boxList[index], () {

                       }));
                  }),
              ))
        ],
      ),
    );
  }

  void getHttp() async {
    try {
      var response = await ApiUtil.getInstance().get(Api.NAVI);
      Map<String, dynamic> map = json.decode(response.toString());
      var navigationEntity = NavigationEntity.fromJson(map);
      setState(() {
        boxList = navigationEntity.getData();
        selectItem = boxList[0];
      });
    } catch (e) {
      LogUtil.log(e.toString());
    }
  }

  Widget getBoxItem(NavigationEntityData item, GestureTapCallback onTop) {
    var selectColor = item == selectItem ? Colors.white : Colors.grey;
    return InkWell(
      onTap: onTop,
      child: Container(
          alignment: Alignment.center,
          color: selectColor,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
                child: Text(
                  item.name,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
              if (item == selectItem)
                const Divider(
                  height: 2,
                  color: Colors.blue,
                  thickness: 2,
                )
            ],
          )),
    );
  }

  Widget getItem(NavigationEntityData item, GestureTapCallback onTop) {
    return Column(
      children: [
        Container(alignment: Alignment.centerLeft, margin: const EdgeInsets.symmetric(vertical: 12), child: Text(item.name)),
        SizedBox(
            width: double.infinity,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              children: item.articles.map<Widget>((NavigationEntityDataArticles data) {
                return Container(
                  height: 26,
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(4)),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      data.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }).toList(),
            ))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
  
  @override
  bool get wantKeepAlive => true;
}
