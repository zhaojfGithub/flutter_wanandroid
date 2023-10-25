import 'package:fun_wanandroid/entity/project_entity.dart';
import 'package:fun_wanandroid/generated/json/base/json_field.dart';
import 'package:fun_wanandroid/generated/json/project_tab_entity.g.dart';
import 'dart:convert';
export 'package:fun_wanandroid/generated/json/project_tab_entity.g.dart';

@JsonSerializable()
class ProjectTabEntity {
	late List<ProjectTabEntityData> data = [];
	late int errorCode = -1;
	late String errorMsg = '';

	ProjectTabEntity();

	factory ProjectTabEntity.fromJson(Map<String, dynamic> json) => $ProjectTabEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProjectTabEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	List<ProjectTabEntityData> getData(){
		if (errorCode == 0) {
			return data;
		}
		throw Exception(errorMsg);
	}
}

@JsonSerializable()
class ProjectTabEntityData {
	late List<dynamic> articleList = [];
	late String author = '';
	late List<ProjectEntityDataDatas> children = [];
	late int page = 1;
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

	ProjectTabEntityData();

	factory ProjectTabEntityData.fromJson(Map<String, dynamic> json) => $ProjectTabEntityDataFromJson(json);

	Map<String, dynamic> toJson() => $ProjectTabEntityDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}