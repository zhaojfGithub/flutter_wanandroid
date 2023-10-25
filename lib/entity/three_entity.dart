import 'package:fun_wanandroid/entity/article_entity.dart';
import 'package:fun_wanandroid/generated/json/base/json_field.dart';
import 'dart:convert';

import '../generated/json/three_entity.g.dart';


@JsonSerializable()
class TreeEntity {
	late List<TreeEntityData> data = [];
	late int errorCode = -1;
	late String errorMsg = '';

	TreeEntity();

	factory TreeEntity.fromJson(Map<String, dynamic> json) => $TreeEntityFromJson(json);

	Map<String, dynamic> toJson() => $TreeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	List<TreeEntityData> getData(){
		if(errorCode == 0){
			return data;
		}
		throw Exception(errorMsg);
	}
}

@JsonSerializable()
class TreeEntityData {
	late List<ArticleEntityDataDatas> articleList = [];
	late String author = '';
	late List<TreeEntityDataChildren> children = [];
	late int courseId = -1;
	late String cover = '';
	late String desc = '';
	late int id = -1;
	late String lisense = '';
	late String lisenseLink = '';
	late String name = '';
	late int order = -1;
	late int parentChapterId = -1;
	late int type = -1;
	late bool userControlSetTop = false;
	late int visible = -1;
	late bool isExpanded = false;
	late int page = 0;

	TreeEntityData();

	factory TreeEntityData.fromJson(Map<String, dynamic> json) => $TreeEntityDataFromJson(json);

	Map<String, dynamic> toJson() => $TreeEntityDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class TreeEntityDataChildren {
	late List<dynamic> articleList = [];
	late String author = '';
	late List<dynamic> children = [];
	late int courseId = -1;
	late String cover = '';
	late String desc = '';
	late int id = -1;
	late String lisense = '';
	late String lisenseLink = '';
	late String name = '';
	late int order = -1;
	late int parentChapterId = -1;
	late int type = -1;
	late bool userControlSetTop = false;
	late int visible = -1;

	TreeEntityDataChildren();

	factory TreeEntityDataChildren.fromJson(Map<String, dynamic> json) => $TreeEntityDataChildrenFromJson(json);

	Map<String, dynamic> toJson() => $TreeEntityDataChildrenToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}