import 'package:fun_wanandroid/generated/json/base/json_convert_content.dart';
import 'package:fun_wanandroid/entity/project_tab_entity.dart';
import 'package:fun_wanandroid/entity/project_entity.dart';


ProjectTabEntity $ProjectTabEntityFromJson(Map<String, dynamic> json) {
  final ProjectTabEntity projectTabEntity = ProjectTabEntity();
  final List<ProjectTabEntityData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<ProjectTabEntityData>(e) as ProjectTabEntityData).toList();
  if (data != null) {
    projectTabEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    projectTabEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    projectTabEntity.errorMsg = errorMsg;
  }
  return projectTabEntity;
}

Map<String, dynamic> $ProjectTabEntityToJson(ProjectTabEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

extension ProjectTabEntityExtension on ProjectTabEntity {
  ProjectTabEntity copyWith({
    List<ProjectTabEntityData>? data,
    int? errorCode,
    String? errorMsg,
  }) {
    return ProjectTabEntity()
      ..data = data ?? this.data
      ..errorCode = errorCode ?? this.errorCode
      ..errorMsg = errorMsg ?? this.errorMsg;
  }
}

ProjectTabEntityData $ProjectTabEntityDataFromJson(Map<String, dynamic> json) {
  final ProjectTabEntityData projectTabEntityData = ProjectTabEntityData();
  final List<dynamic>? articleList = (json['articleList'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (articleList != null) {
    projectTabEntityData.articleList = articleList;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    projectTabEntityData.author = author;
  }
  final List<ProjectEntityDataDatas>? children = (json['children'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<ProjectEntityDataDatas>(e) as ProjectEntityDataDatas).toList();
  if (children != null) {
    projectTabEntityData.children = children;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    projectTabEntityData.page = page;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    projectTabEntityData.courseId = courseId;
  }
  final String? cover = jsonConvert.convert<String>(json['cover']);
  if (cover != null) {
    projectTabEntityData.cover = cover;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    projectTabEntityData.desc = desc;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    projectTabEntityData.id = id;
  }
  final String? lisense = jsonConvert.convert<String>(json['lisense']);
  if (lisense != null) {
    projectTabEntityData.lisense = lisense;
  }
  final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
  if (lisenseLink != null) {
    projectTabEntityData.lisenseLink = lisenseLink;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    projectTabEntityData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    projectTabEntityData.order = order;
  }
  final int? parentChapterId = jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    projectTabEntityData.parentChapterId = parentChapterId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    projectTabEntityData.type = type;
  }
  final bool? userControlSetTop = jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    projectTabEntityData.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    projectTabEntityData.visible = visible;
  }
  return projectTabEntityData;
}

Map<String, dynamic> $ProjectTabEntityDataToJson(ProjectTabEntityData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['articleList'] = entity.articleList;
  data['author'] = entity.author;
  data['children'] = entity.children.map((v) => v.toJson()).toList();
  data['page'] = entity.page;
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

extension ProjectTabEntityDataExtension on ProjectTabEntityData {
  ProjectTabEntityData copyWith({
    List<dynamic>? articleList,
    String? author,
    List<ProjectEntityDataDatas>? children,
    int? page,
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
    return ProjectTabEntityData()
      ..articleList = articleList ?? this.articleList
      ..author = author ?? this.author
      ..children = children ?? this.children
      ..page = page ?? this.page
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