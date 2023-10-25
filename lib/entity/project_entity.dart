import 'package:fun_wanandroid/generated/json/base/json_field.dart';
import 'package:fun_wanandroid/generated/json/project_entity.g.dart';
import 'dart:convert';
export 'package:fun_wanandroid/generated/json/project_entity.g.dart';

@JsonSerializable()
class ProjectEntity {
	late ProjectEntityData data;
	late int errorCode = -1;
	late String errorMsg = '';

	ProjectEntity();

	factory ProjectEntity.fromJson(Map<String, dynamic> json) => $ProjectEntityFromJson(json);

	Map<String, dynamic> toJson() => $ProjectEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	ProjectEntityData getData(){
		if (errorCode == 0) {
			return data;
		}
		throw Exception(errorMsg);
	}

}

@JsonSerializable()
class ProjectEntityData {
	late int curPage = -1;
	late List<ProjectEntityDataDatas> datas = [];
	late int offset = -1;
	late bool over = false;
	late int pageCount = -1;
	late int size = -1;
	late int total = -1;

	ProjectEntityData();

	factory ProjectEntityData.fromJson(Map<String, dynamic> json) => $ProjectEntityDataFromJson(json);

	Map<String, dynamic> toJson() => $ProjectEntityDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProjectEntityDataDatas {
	late bool adminAdd = false;
	late String apkLink = '';
	late int audit = -1;
	late String author = '';
	late bool canEdit = false;
	late int chapterId = -1;
	late String chapterName = '';
	late bool collect = false;
	late int courseId = -1;
	late String desc = '';
	late String descMd = '';
	late String envelopePic = '';
	late bool fresh = false;
	late String host = '';
	late int id = -1;
	late bool isAdminAdd = false;
	late String link = '';
	late String niceDate = '';
	late String niceShareDate = '';
	late String origin = '';
	late String prefix = '';
	late String projectLink = '';
	late int publishTime = -1;
	late int realSuperChapterId = -1;
	late int selfVisible = -1;
	late int shareDate = -1;
	late String shareUser = '';
	late int superChapterId = -1;
	late String superChapterName = '';
	late List<ProjectEntityDataDatasTags> tags = [];
	late String title = '';
	late int type = -1;
	late int userId = -1;
	late int visible = -1;
	late int zan = -1;

	ProjectEntityDataDatas();

	factory ProjectEntityDataDatas.fromJson(Map<String, dynamic> json) => $ProjectEntityDataDatasFromJson(json);

	Map<String, dynamic> toJson() => $ProjectEntityDataDatasToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class ProjectEntityDataDatasTags {
	late String name = '';
	late String url = '';

	ProjectEntityDataDatasTags();

	factory ProjectEntityDataDatasTags.fromJson(Map<String, dynamic> json) => $ProjectEntityDataDatasTagsFromJson(json);

	Map<String, dynamic> toJson() => $ProjectEntityDataDatasTagsToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}