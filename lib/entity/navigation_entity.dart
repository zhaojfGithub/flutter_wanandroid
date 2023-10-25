import 'package:fun_wanandroid/generated/json/base/json_field.dart';
import 'package:fun_wanandroid/generated/json/navigation_entity.g.dart';
import 'dart:convert';
export 'package:fun_wanandroid/generated/json/navigation_entity.g.dart';

@JsonSerializable()
class NavigationEntity {
	late List<NavigationEntityData> data = [];
	late int errorCode = -1;
	late String errorMsg = '';

	NavigationEntity();

	factory NavigationEntity.fromJson(Map<String, dynamic> json) => $NavigationEntityFromJson(json);

	Map<String, dynamic> toJson() => $NavigationEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	List<NavigationEntityData> getData(){
		if (errorCode == 0) {
			return data;
		}
		throw Exception(errorMsg);
	}
}

@JsonSerializable()
class NavigationEntityData {
	late List<NavigationEntityDataArticles> articles = [];
	late int cid = -1;
	late String name = '';

	NavigationEntityData();

	factory NavigationEntityData.fromJson(Map<String, dynamic> json) => $NavigationEntityDataFromJson(json);

	Map<String, dynamic> toJson() => $NavigationEntityDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class NavigationEntityDataArticles {
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
	late List<dynamic> tags = [];
	late String title = '';
	late int type = -1;
	late int userId = -1;
	late int visible = -1;
	late int zan = -1;

	NavigationEntityDataArticles();

	factory NavigationEntityDataArticles.fromJson(Map<String, dynamic> json) => $NavigationEntityDataArticlesFromJson(json);

	Map<String, dynamic> toJson() => $NavigationEntityDataArticlesToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}