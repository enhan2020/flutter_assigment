import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

class UserServices {
  Future<List<UserModel>> getUserJson() async {
    final response = await rootBundle.loadString('assets/json/data.json');
    final userModelData = jsonDecode(response) as List<dynamic>;
    final userModel = userModelData.map((e) => UserModel.fromJson(e)).toList();

    return userModel;
  }

  saveDataToLocal(List<UserModel> userModel) async {
    List<dynamic> stringData = userModel.map((e) => e.toJson()).toList();
    await Get.find<SharedPreferences>().setString("user", jsonEncode(stringData));
  }

  Future<List<UserModel>> getDataFromLocal() async {
    final response = Get.find<SharedPreferences>().getString("user");
    final userModelData = response != null ? jsonDecode(response) as List<dynamic> : <UserModel>[];
    final userModel = userModelData.map((e) => UserModel.fromJson(e)).toList();

    return userModel;
  }
}
