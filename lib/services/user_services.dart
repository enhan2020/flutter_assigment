import 'dart:convert';

import 'package:flutter/services.dart';

import '../model/user_model.dart';

class UserServices {
  Future<List<UserModel>> getUserJson() async {
    final response = await rootBundle.loadString('assets/json/data.json');
    final userModelData = jsonDecode(response) as List<dynamic>;
    final userModel = userModelData.map((e) => UserModel.fromJson(e)).toList();

    return userModel;
  }
}
