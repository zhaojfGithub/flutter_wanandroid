import 'package:fun_wanandroid/generated/json/base/json_field.dart';
import 'package:fun_wanandroid/generated/json/article_entity.g.dart';
import 'dart:convert';
export 'package:fun_wanandroid/generated/json/article_entity.g.dart';

@JsonSerializable()
class ArticleEntity {
  late ArticleEntityData data;
  late int errorCode = -1;
  late String errorMsg = '';

  ArticleEntity();

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      $ArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  ArticleEntityData getData() {
    if (errorCode == 0) {
      return data;
    }
    throw Exception(errorMsg);
  }
}

@JsonSerializable()
class ArticleEntityData {
  late int curPage = -1;
  late List<ArticleEntityDataDatas> datas = [];
  late int offset = -1;
  late bool over = false;
  late int pageCount = -1;
  late int size = -1;
  late int total = -1;

  ArticleEntityData();

  factory ArticleEntityData.fromJson(Map<String, dynamic> json) =>
      $ArticleEntityDataFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleEntityDataDatas {
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
  late List<ArticleEntityDataDatasTags> tags = [];
  late String title = '';
  late int type = -1;
  late int userId = -1;
  late int visible = -1;
  late int zan = -1;

  ArticleEntityDataDatas();

  factory ArticleEntityDataDatas.fromJson(Map<String, dynamic> json) =>
      $ArticleEntityDataDatasFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleEntityDataDatasTags {
  late String name = '';
  late String url = '';

  ArticleEntityDataDatasTags();

  factory ArticleEntityDataDatasTags.fromJson(Map<String, dynamic> json) =>
      $ArticleEntityDataDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityDataDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
