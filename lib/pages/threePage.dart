import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fun_wanandroid/http/api.dart';
import 'package:fun_wanandroid/http/apiUtil.dart';
import 'package:fun_wanandroid/pages/three_details_page.dart';
import 'package:fun_wanandroid/utils/logUtil.dart';

import '../entity/three_entity.dart';

class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ThreePageState();
  }
}

class _ThreePageState extends State<ThreePage>
    with AutomaticKeepAliveClientMixin {
  List<TreeEntityData> _threeData = [];

  int _selectIndex = -1;

  @override
  void initState() {
    super.initState();
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        body: RefreshIndicator(
            color: Theme.of(context).primaryColor,
            displacement: 40,
            onRefresh: () async {
              getHttp();
            },
            child: ListView.builder(
                itemCount: _threeData.length,
                itemBuilder: (BuildContext context, int index) {
                  Iterable<Widget> widgetData = [];
                  if (_threeData[index].isExpanded) {
                    widgetData = _threeData[index]
                        .children
                        .map((TreeEntityDataChildren entity) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return ThreeDetailsPage(panelIndex: _selectIndex, index: index);
                          }));
                        },
                        child: SizedBox(
                          height: 18,
                          child: Column(
                            children: [
                              const Divider(
                                color: Colors.white,
                                height: 0.5,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    entity.name,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  }
                  return Container(
                    margin: const EdgeInsets.only(left: 16, top: 6, right: 16),
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.blue),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (_selectIndex != -1) {
                                _threeData[_selectIndex].isExpanded = false;
                              }
                              if (_selectIndex == index) {
                                _threeData[_selectIndex].isExpanded = false;
                                _selectIndex = -1;
                              } else {
                                _threeData[index].isExpanded = true;
                                _selectIndex = index;
                              }
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: Center(
                              child: Text(
                                _threeData[index].name,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                        ...widgetData
                      ],
                    ),
                  );
                })));
  }

  void getHttp() async {
    try {
      var response = await ApiUtil.getInstance().get(Api.TREE);
      Map<String, dynamic> map = json.decode(response.toString());
      var treeEntity = TreeEntity.fromJson(map);
      setState(() {
        _threeData = treeEntity.getData();
      });
    } catch (e) {
      LogUtil.log(e.toString());
    }
  }

  Widget getBoxItem(TreeEntityData item) {
    return Container(
      color: Colors.blue,
      child: ListTile(
          title: Text(item.name),
          trailing: item.isExpanded
              ? const Icon(Icons.arrow_downward)
              : const Icon(Icons.arrow_forward_outlined)),
    );
  }

  Widget getItem(TreeEntityDataChildren item) {
    return ListTile(
      title: Text(item.name),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
