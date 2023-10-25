// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:fun_wanandroid/entity/article_entity.dart';
import 'package:fun_wanandroid/entity/banner_entity.dart';
import 'package:fun_wanandroid/entity/navigation_entity.dart';
import 'package:fun_wanandroid/entity/project_entity.dart';
import 'package:fun_wanandroid/entity/project_tab_entity.dart';
import 'package:fun_wanandroid/entity/three_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<ArticleEntity>[] is M) {
      return data.map<ArticleEntity>((Map<String, dynamic> e) => ArticleEntity.fromJson(e)).toList() as M;
    }
    if (<ArticleEntityData>[] is M) {
      return data.map<ArticleEntityData>((Map<String, dynamic> e) => ArticleEntityData.fromJson(e)).toList() as M;
    }
    if (<ArticleEntityDataDatas>[] is M) {
      return data.map<ArticleEntityDataDatas>((Map<String, dynamic> e) => ArticleEntityDataDatas.fromJson(e)).toList() as M;
    }
    if (<ArticleEntityDataDatasTags>[] is M) {
      return data.map<ArticleEntityDataDatasTags>((Map<String, dynamic> e) => ArticleEntityDataDatasTags.fromJson(e)).toList() as M;
    }
    if (<BannerEntity>[] is M) {
      return data.map<BannerEntity>((Map<String, dynamic> e) => BannerEntity.fromJson(e)).toList() as M;
    }
    if (<BannerEntityData>[] is M) {
      return data.map<BannerEntityData>((Map<String, dynamic> e) => BannerEntityData.fromJson(e)).toList() as M;
    }
    if (<NavigationEntity>[] is M) {
      return data.map<NavigationEntity>((Map<String, dynamic> e) => NavigationEntity.fromJson(e)).toList() as M;
    }
    if (<NavigationEntityData>[] is M) {
      return data.map<NavigationEntityData>((Map<String, dynamic> e) => NavigationEntityData.fromJson(e)).toList() as M;
    }
    if (<NavigationEntityDataArticles>[] is M) {
      return data.map<NavigationEntityDataArticles>((Map<String, dynamic> e) => NavigationEntityDataArticles.fromJson(e)).toList() as M;
    }
    if (<ProjectEntity>[] is M) {
      return data.map<ProjectEntity>((Map<String, dynamic> e) => ProjectEntity.fromJson(e)).toList() as M;
    }
    if (<ProjectEntityData>[] is M) {
      return data.map<ProjectEntityData>((Map<String, dynamic> e) => ProjectEntityData.fromJson(e)).toList() as M;
    }
    if (<ProjectEntityDataDatas>[] is M) {
      return data.map<ProjectEntityDataDatas>((Map<String, dynamic> e) => ProjectEntityDataDatas.fromJson(e)).toList() as M;
    }
    if (<ProjectEntityDataDatasTags>[] is M) {
      return data.map<ProjectEntityDataDatasTags>((Map<String, dynamic> e) => ProjectEntityDataDatasTags.fromJson(e)).toList() as M;
    }
    if (<ProjectTabEntity>[] is M) {
      return data.map<ProjectTabEntity>((Map<String, dynamic> e) => ProjectTabEntity.fromJson(e)).toList() as M;
    }
    if (<ProjectTabEntityData>[] is M) {
      return data.map<ProjectTabEntityData>((Map<String, dynamic> e) => ProjectTabEntityData.fromJson(e)).toList() as M;
    }
    if (<TreeEntity>[] is M) {
      return data.map<TreeEntity>((Map<String, dynamic> e) => TreeEntity.fromJson(e)).toList() as M;
    }
    if (<TreeEntityData>[] is M) {
      return data.map<TreeEntityData>((Map<String, dynamic> e) => TreeEntityData.fromJson(e)).toList() as M;
    }
    if (<TreeEntityDataChildren>[] is M) {
      return data.map<TreeEntityDataChildren>((Map<String, dynamic> e) => TreeEntityDataChildren.fromJson(e)).toList() as M;
    }

    debugPrint("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (ArticleEntity).toString(): ArticleEntity.fromJson,
    (ArticleEntityData).toString(): ArticleEntityData.fromJson,
    (ArticleEntityDataDatas).toString(): ArticleEntityDataDatas.fromJson,
    (ArticleEntityDataDatasTags).toString(): ArticleEntityDataDatasTags.fromJson,
    (BannerEntity).toString(): BannerEntity.fromJson,
    (BannerEntityData).toString(): BannerEntityData.fromJson,
    (NavigationEntity).toString(): NavigationEntity.fromJson,
    (NavigationEntityData).toString(): NavigationEntityData.fromJson,
    (NavigationEntityDataArticles).toString(): NavigationEntityDataArticles.fromJson,
    (ProjectEntity).toString(): ProjectEntity.fromJson,
    (ProjectEntityData).toString(): ProjectEntityData.fromJson,
    (ProjectEntityDataDatas).toString(): ProjectEntityDataDatas.fromJson,
    (ProjectEntityDataDatasTags).toString(): ProjectEntityDataDatasTags.fromJson,
    (ProjectTabEntity).toString(): ProjectTabEntity.fromJson,
    (ProjectTabEntityData).toString(): ProjectTabEntityData.fromJson,
    (TreeEntity).toString(): TreeEntity.fromJson,
    (TreeEntityData).toString(): TreeEntityData.fromJson,
    (TreeEntityDataChildren).toString(): TreeEntityDataChildren.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}