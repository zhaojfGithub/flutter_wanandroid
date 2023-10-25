import 'package:fun_wanandroid/generated/json/base/json_convert_content.dart';
import 'package:fun_wanandroid/entity/navigation_entity.dart';

NavigationEntity $NavigationEntityFromJson(Map<String, dynamic> json) {
  final NavigationEntity navigationEntity = NavigationEntity();
  final List<NavigationEntityData>? data = (json['data'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NavigationEntityData>(e) as NavigationEntityData).toList();
  if (data != null) {
    navigationEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    navigationEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    navigationEntity.errorMsg = errorMsg;
  }
  return navigationEntity;
}

Map<String, dynamic> $NavigationEntityToJson(NavigationEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

extension NavigationEntityExtension on NavigationEntity {
  NavigationEntity copyWith({
    List<NavigationEntityData>? data,
    int? errorCode,
    String? errorMsg,
  }) {
    return NavigationEntity()
      ..data = data ?? this.data
      ..errorCode = errorCode ?? this.errorCode
      ..errorMsg = errorMsg ?? this.errorMsg;
  }
}

NavigationEntityData $NavigationEntityDataFromJson(Map<String, dynamic> json) {
  final NavigationEntityData navigationEntityData = NavigationEntityData();
  final List<NavigationEntityDataArticles>? articles = (json['articles'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<NavigationEntityDataArticles>(e) as NavigationEntityDataArticles).toList();
  if (articles != null) {
    navigationEntityData.articles = articles;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    navigationEntityData.cid = cid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    navigationEntityData.name = name;
  }
  return navigationEntityData;
}

Map<String, dynamic> $NavigationEntityDataToJson(NavigationEntityData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['articles'] = entity.articles.map((v) => v.toJson()).toList();
  data['cid'] = entity.cid;
  data['name'] = entity.name;
  return data;
}

extension NavigationEntityDataExtension on NavigationEntityData {
  NavigationEntityData copyWith({
    List<NavigationEntityDataArticles>? articles,
    int? cid,
    String? name,
  }) {
    return NavigationEntityData()
      ..articles = articles ?? this.articles
      ..cid = cid ?? this.cid
      ..name = name ?? this.name;
  }
}

NavigationEntityDataArticles $NavigationEntityDataArticlesFromJson(Map<String, dynamic> json) {
  final NavigationEntityDataArticles navigationEntityDataArticles = NavigationEntityDataArticles();
  final bool? adminAdd = jsonConvert.convert<bool>(json['adminAdd']);
  if (adminAdd != null) {
    navigationEntityDataArticles.adminAdd = adminAdd;
  }
  final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
  if (apkLink != null) {
    navigationEntityDataArticles.apkLink = apkLink;
  }
  final int? audit = jsonConvert.convert<int>(json['audit']);
  if (audit != null) {
    navigationEntityDataArticles.audit = audit;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    navigationEntityDataArticles.author = author;
  }
  final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
  if (canEdit != null) {
    navigationEntityDataArticles.canEdit = canEdit;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    navigationEntityDataArticles.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    navigationEntityDataArticles.chapterName = chapterName;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    navigationEntityDataArticles.collect = collect;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    navigationEntityDataArticles.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    navigationEntityDataArticles.desc = desc;
  }
  final String? descMd = jsonConvert.convert<String>(json['descMd']);
  if (descMd != null) {
    navigationEntityDataArticles.descMd = descMd;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    navigationEntityDataArticles.envelopePic = envelopePic;
  }
  final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
  if (fresh != null) {
    navigationEntityDataArticles.fresh = fresh;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    navigationEntityDataArticles.host = host;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    navigationEntityDataArticles.id = id;
  }
  final bool? isAdminAdd = jsonConvert.convert<bool>(json['isAdminAdd']);
  if (isAdminAdd != null) {
    navigationEntityDataArticles.isAdminAdd = isAdminAdd;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    navigationEntityDataArticles.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    navigationEntityDataArticles.niceDate = niceDate;
  }
  final String? niceShareDate = jsonConvert.convert<String>(json['niceShareDate']);
  if (niceShareDate != null) {
    navigationEntityDataArticles.niceShareDate = niceShareDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    navigationEntityDataArticles.origin = origin;
  }
  final String? prefix = jsonConvert.convert<String>(json['prefix']);
  if (prefix != null) {
    navigationEntityDataArticles.prefix = prefix;
  }
  final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
  if (projectLink != null) {
    navigationEntityDataArticles.projectLink = projectLink;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    navigationEntityDataArticles.publishTime = publishTime;
  }
  final int? realSuperChapterId = jsonConvert.convert<int>(json['realSuperChapterId']);
  if (realSuperChapterId != null) {
    navigationEntityDataArticles.realSuperChapterId = realSuperChapterId;
  }
  final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
  if (selfVisible != null) {
    navigationEntityDataArticles.selfVisible = selfVisible;
  }
  final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
  if (shareDate != null) {
    navigationEntityDataArticles.shareDate = shareDate;
  }
  final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
  if (shareUser != null) {
    navigationEntityDataArticles.shareUser = shareUser;
  }
  final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
  if (superChapterId != null) {
    navigationEntityDataArticles.superChapterId = superChapterId;
  }
  final String? superChapterName = jsonConvert.convert<String>(json['superChapterName']);
  if (superChapterName != null) {
    navigationEntityDataArticles.superChapterName = superChapterName;
  }
  final List<dynamic>? tags = (json['tags'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (tags != null) {
    navigationEntityDataArticles.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    navigationEntityDataArticles.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    navigationEntityDataArticles.type = type;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    navigationEntityDataArticles.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    navigationEntityDataArticles.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    navigationEntityDataArticles.zan = zan;
  }
  return navigationEntityDataArticles;
}

Map<String, dynamic> $NavigationEntityDataArticlesToJson(NavigationEntityDataArticles entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['adminAdd'] = entity.adminAdd;
  data['apkLink'] = entity.apkLink;
  data['audit'] = entity.audit;
  data['author'] = entity.author;
  data['canEdit'] = entity.canEdit;
  data['chapterId'] = entity.chapterId;
  data['chapterName'] = entity.chapterName;
  data['collect'] = entity.collect;
  data['courseId'] = entity.courseId;
  data['desc'] = entity.desc;
  data['descMd'] = entity.descMd;
  data['envelopePic'] = entity.envelopePic;
  data['fresh'] = entity.fresh;
  data['host'] = entity.host;
  data['id'] = entity.id;
  data['isAdminAdd'] = entity.isAdminAdd;
  data['link'] = entity.link;
  data['niceDate'] = entity.niceDate;
  data['niceShareDate'] = entity.niceShareDate;
  data['origin'] = entity.origin;
  data['prefix'] = entity.prefix;
  data['projectLink'] = entity.projectLink;
  data['publishTime'] = entity.publishTime;
  data['realSuperChapterId'] = entity.realSuperChapterId;
  data['selfVisible'] = entity.selfVisible;
  data['shareDate'] = entity.shareDate;
  data['shareUser'] = entity.shareUser;
  data['superChapterId'] = entity.superChapterId;
  data['superChapterName'] = entity.superChapterName;
  data['tags'] = entity.tags;
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  data['zan'] = entity.zan;
  return data;
}

extension NavigationEntityDataArticlesExtension on NavigationEntityDataArticles {
  NavigationEntityDataArticles copyWith({
    bool? adminAdd,
    String? apkLink,
    int? audit,
    String? author,
    bool? canEdit,
    int? chapterId,
    String? chapterName,
    bool? collect,
    int? courseId,
    String? desc,
    String? descMd,
    String? envelopePic,
    bool? fresh,
    String? host,
    int? id,
    bool? isAdminAdd,
    String? link,
    String? niceDate,
    String? niceShareDate,
    String? origin,
    String? prefix,
    String? projectLink,
    int? publishTime,
    int? realSuperChapterId,
    int? selfVisible,
    int? shareDate,
    String? shareUser,
    int? superChapterId,
    String? superChapterName,
    List<dynamic>? tags,
    String? title,
    int? type,
    int? userId,
    int? visible,
    int? zan,
  }) {
    return NavigationEntityDataArticles()
      ..adminAdd = adminAdd ?? this.adminAdd
      ..apkLink = apkLink ?? this.apkLink
      ..audit = audit ?? this.audit
      ..author = author ?? this.author
      ..canEdit = canEdit ?? this.canEdit
      ..chapterId = chapterId ?? this.chapterId
      ..chapterName = chapterName ?? this.chapterName
      ..collect = collect ?? this.collect
      ..courseId = courseId ?? this.courseId
      ..desc = desc ?? this.desc
      ..descMd = descMd ?? this.descMd
      ..envelopePic = envelopePic ?? this.envelopePic
      ..fresh = fresh ?? this.fresh
      ..host = host ?? this.host
      ..id = id ?? this.id
      ..isAdminAdd = isAdminAdd ?? this.isAdminAdd
      ..link = link ?? this.link
      ..niceDate = niceDate ?? this.niceDate
      ..niceShareDate = niceShareDate ?? this.niceShareDate
      ..origin = origin ?? this.origin
      ..prefix = prefix ?? this.prefix
      ..projectLink = projectLink ?? this.projectLink
      ..publishTime = publishTime ?? this.publishTime
      ..realSuperChapterId = realSuperChapterId ?? this.realSuperChapterId
      ..selfVisible = selfVisible ?? this.selfVisible
      ..shareDate = shareDate ?? this.shareDate
      ..shareUser = shareUser ?? this.shareUser
      ..superChapterId = superChapterId ?? this.superChapterId
      ..superChapterName = superChapterName ?? this.superChapterName
      ..tags = tags ?? this.tags
      ..title = title ?? this.title
      ..type = type ?? this.type
      ..userId = userId ?? this.userId
      ..visible = visible ?? this.visible
      ..zan = zan ?? this.zan;
  }
}