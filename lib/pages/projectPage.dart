import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:fun_wanandroid/entity/project_entity.dart';
import 'package:fun_wanandroid/entity/project_tab_entity.dart';
import 'package:fun_wanandroid/http/api.dart';
import 'package:fun_wanandroid/http/apiUtil.dart';
import 'package:fun_wanandroid/item/projectItem.dart';

import '../utils/logUtil.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProjectState();
  }
}

class _ProjectState extends State<ProjectPage> with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  var page = 1;

  late TabController _controller;
  List<ProjectTabEntityData> _projectTabData = [];

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 0, vsync: this);
    getHttp();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: TabBar(
          controller: _controller,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(fontSize: 16),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontSize: 14),
          indicatorColor: Theme.of(context).primaryColor,
          isScrollable: true,
          onTap: (int index) {},
          tabs: _projectTabData.map((ProjectTabEntityData tabItem) {
            return Tab(text: tabItem.name);
          }).toList()),
      body: TabBarView(
        controller: _controller,
        children: _projectTabData.map((ProjectTabEntityData tabItem) {
          return ListView.builder(
            itemCount: tabItem.children.length,
            itemBuilder: (BuildContext context, int index) {
              return ProjectListItem(
                  item: tabItem.children[index],
                  onTop: (int id) {
                    //点击事件，回调Id
                  });
            },
          );
        }).toList(),
      ),
    );
  }

  void getHttp() async {
    try {
      var projectTabResponse = await ApiUtil.getInstance().get(Api.PROJECT);
      Map<String, dynamic> tabMap = json.decode(projectTabResponse.toString());
      var projectTabEntity = ProjectTabEntity.fromJson(tabMap);
      setState(() {
        _projectTabData = projectTabEntity.getData();
      });
      _controller = TabController(length: _projectTabData.length, vsync: this);
      _controller.addListener(() async {
        if (_projectTabData[_controller.index].children.isEmpty) {
          getDetails(_projectTabData[_controller.index]);
        }
      });
      if(_projectTabData.isNotEmpty){
        getDetails(_projectTabData[0]);
      }
    } catch (e) {
      LogUtil.log(e.toString());
    }
  }

  void getDetails(ProjectTabEntityData item) async {
    try {
      var data = {"cid": item.id};
      var response = await ApiUtil.getInstance().get("${Api.PROJECT_LIST}${item.page}/json", data: data);
      Map<String,dynamic> map = json.decode(response.toString());
      setState(() {
        item.children = ProjectEntity.fromJson(map).getData().datas;
      });
    } catch (e) {
      LogUtil.log(e.toString());
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
