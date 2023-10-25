import 'package:fun_wanandroid/generated/json/base/json_field.dart';
import 'package:fun_wanandroid/generated/json/banner_entity.g.dart';
import 'dart:convert';
export 'package:fun_wanandroid/generated/json/banner_entity.g.dart';

@JsonSerializable()
class BannerEntity {
	late List<BannerEntityData> data = [];
	late int errorCode = -1;
	late String errorMsg = '';

	BannerEntity();

	factory BannerEntity.fromJson(Map<String, dynamic> json) => $BannerEntityFromJson(json);

	Map<String, dynamic> toJson() => $BannerEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}

	List<BannerEntityData> getData(){
		if (errorCode == 0) {
			return data;
		}
		throw Exception(errorMsg);
	}
}

@JsonSerializable()
class BannerEntityData {
	late String desc = '';
	late int id = -1;
	late String imagePath = '';
	late int isVisible = -1;
	late int order = -1;
	late String title = '';
	late int type = -1;
	late String url = '';

	BannerEntityData();

	factory BannerEntityData.fromJson(Map<String, dynamic> json) => $BannerEntityDataFromJson(json);

	Map<String, dynamic> toJson() => $BannerEntityDataToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}