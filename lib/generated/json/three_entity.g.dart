import 'package:fun_wanandroid/generated/json/base/json_convert_content.dart';
import 'package:fun_wanandroid/entity/three_entity.dart';
import 'package:fun_wanandroid/entity/article_entity.dart';


TreeEntity $TreeEntityFromJson(Map<String, dynamic> json) {
  final TreeEntity treeEntity = TreeEntity();
  final List<TreeEntityData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<TreeEntityData>(e) as TreeEntityData).toList();
  if (data != null) {
    treeEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    treeEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    treeEntity.errorMsg = errorMsg;
  }
  return treeEntity;
}

Map<String, dynamic> $TreeEntityToJson(TreeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

extension TreeEntityExtension on TreeEntity {
  TreeEntity copyWith({
    List<TreeEntityData>? data,
    int? errorCode,
    String? errorMsg,
  }) {
    return TreeEntity()
      ..data = data ?? this.data
      ..errorCode = errorCode ?? this.errorCode
      ..errorMsg = errorMsg ?? this.errorMsg;
  }
}

TreeEntityData $TreeEntityDataFromJson(Map<String, dynamic> json) {
  final TreeEntityData treeEntityData = TreeEntityData();
  final List<ArticleEntityDataDatas>? articleList = (json['articleList'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<ArticleEntityDataDatas>(e) as ArticleEntityDataDatas).toList();
  if (articleList != null) {
    treeEntityData.articleList = articleList;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    treeEntityData.author = author;
  }
  final List<TreeEntityDataChildren>? children = (json['children'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<TreeEntityDataChildren>(e) as TreeEntityDataChildren).toList();
  if (children != null) {
    treeEntityData.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    treeEntityData.courseId = courseId;
  }
  final String? cover = jsonConvert.convert<String>(json['cover']);
  if (cover != null) {
    treeEntityData.cover = cover;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    treeEntityData.desc = desc;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    treeEntityData.id = id;
  }
  final String? lisense = jsonConvert.convert<String>(json['lisense']);
  if (lisense != null) {
    treeEntityData.lisense = lisense;
  }
  final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
  if (lisenseLink != null) {
    treeEntityData.lisenseLink = lisenseLink;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    treeEntityData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    treeEntityData.order = order;
  }
  final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    treeEntityData.parentChapterId = parentChapterId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    treeEntityData.type = type;
  }
  final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    treeEntityData.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    treeEntityData.visible = visible;
  }
  final bool? isExpanded = jsonConvert.convert<bool>(json['isExpanded']);
  if (isExpanded != null) {
    treeEntityData.isExpanded = isExpanded;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    treeEntityData.page = page;
  }
  return treeEntityData;
}

Map<String, dynamic> $TreeEntityDataToJson(TreeEntityData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['articleList'] = entity.articleList.map((v) => v.toJson()).toList();
  data['author'] = entity.author;
  data['children'] = entity.children.map((v) => v.toJson()).toList();
  data['courseId'] = entity.courseId;
  data['cover'] = entity.cover;
  data['desc'] = entity.desc;
  data['id'] = entity.id;
  data['lisense'] = entity.lisense;
  data['lisenseLink'] = entity.lisenseLink;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['parentChapterId'] = entity.parentChapterId;
  data['type'] = entity.type;
  data['userControlSetTop'] = entity.userControlSetTop;
  data['visible'] = entity.visible;
  data['isExpanded'] = entity.isExpanded;
  data['page'] = entity.page;
  return data;
}

extension TreeEntityDataExtension on TreeEntityData {
  TreeEntityData copyWith({
    List<ArticleEntityDataDatas>? articleList,
    String? author,
    List<TreeEntityDataChildren>? children,
    int? courseId,
    String? cover,
    String? desc,
    int? id,
    String? lisense,
    String? lisenseLink,
    String? name,
    int? order,
    int? parentChapterId,
    int? type,
    bool? userControlSetTop,
    int? visible,
    bool? isExpanded,
    int? page,
  }) {
    return TreeEntityData()
      ..articleList = articleList ?? this.articleList
      ..author = author ?? this.author
      ..children = children ?? this.children
      ..courseId = courseId ?? this.courseId
      ..cover = cover ?? this.cover
      ..desc = desc ?? this.desc
      ..id = id ?? this.id
      ..lisense = lisense ?? this.lisense
      ..lisenseLink = lisenseLink ?? this.lisenseLink
      ..name = name ?? this.name
      ..order = order ?? this.order
      ..parentChapterId = parentChapterId ?? this.parentChapterId
      ..type = type ?? this.type
      ..userControlSetTop = userControlSetTop ?? this.userControlSetTop
      ..visible = visible ?? this.visible
      ..isExpanded = isExpanded ?? this.isExpanded
      ..page = page ?? this.page;
  }
}

TreeEntityDataChildren $TreeEntityDataChildrenFromJson(Map<String, dynamic> json) {
  final TreeEntityDataChildren treeEntityDataChildren = TreeEntityDataChildren();
  final List<dynamic>? articleList = (json['articleList'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (articleList != null) {
    treeEntityDataChildren.articleList = articleList;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    treeEntityDataChildren.author = author;
  }
  final List<dynamic>? children = (json['children'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (children != null) {
    treeEntityDataChildren.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    treeEntityDataChildren.courseId = courseId;
  }
  final String? cover = jsonConvert.convert<String>(json['cover']);
  if (cover != null) {
    treeEntityDataChildren.cover = cover;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    treeEntityDataChildren.desc = desc;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    treeEntityDataChildren.id = id;
  }
  final String? lisense = jsonConvert.convert<String>(json['lisense']);
  if (lisense != null) {
    treeEntityDataChildren.lisense = lisense;
  }
  final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
  if (lisenseLink != null) {
    treeEntityDataChildren.lisenseLink = lisenseLink;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    treeEntityDataChildren.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    treeEntityDataChildren.order = order;
  }
  final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    treeEntityDataChildren.parentChapterId = parentChapterId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    treeEntityDataChildren.type = type;
  }
  final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    treeEntityDataChildren.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    treeEntityDataChildren.visible = visible;
  }
  return treeEntityDataChildren;
}

Map<String, dynamic> $TreeEntityDataChildrenToJson(TreeEntityDataChildren entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['articleList'] = entity.articleList;
  data['author'] = entity.author;
  data['children'] = entity.children;
  data['courseId'] = entity.courseId;
  data['cover'] = entity.cover;
  data['desc'] = entity.desc;
  data['id'] = entity.id;
  data['lisense'] = entity.lisense;
  data['lisenseLink'] = entity.lisenseLink;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['parentChapterId'] = entity.parentChapterId;
  data['type'] = entity.type;
  data['userControlSetTop'] = entity.userControlSetTop;
  data['visible'] = entity.visible;
  return data;
}

extension TreeEntityDataChildrenExtension on TreeEntityDataChildren {
  TreeEntityDataChildren copyWith({
    List<dynamic>? articleList,
    String? author,
    List<dynamic>? children,
    int? courseId,
    String? cover,
    String? desc,
    int? id,
    String? lisense,
    String? lisenseLink,
    String? name,
    int? order,
    int? parentChapterId,
    int? type,
    bool? userControlSetTop,
    int? visible,
  }) {
    return TreeEntityDataChildren()
      ..articleList = articleList ?? this.articleList
      ..author = author ?? this.author
      ..children = children ?? this.children
      ..courseId = courseId ?? this.courseId
      ..cover = cover ?? this.cover
      ..desc = desc ?? this.desc
      ..id = id ?? this.id
      ..lisense = lisense ?? this.lisense
      ..lisenseLink = lisenseLink ?? this.lisenseLink
      ..name = name ?? this.name
      ..order = order ?? this.order
      ..parentChapterId = parentChapterId ?? this.parentChapterId
      ..type = type ?? this.type
      ..userControlSetTop = userControlSetTop ?? this.userControlSetTop
      ..visible = visible ?? this.visible;
  }
}