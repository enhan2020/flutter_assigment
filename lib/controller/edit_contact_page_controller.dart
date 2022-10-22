import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/controller/contacts_list_page_controller.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'package:flutter_assignment/routes/arguments.dart';
import 'package:flutter_assignment/services/user_services.dart';
import 'package:get/get.dart';

class EditContactPageController extends GetxController {
  ContactsListPageController get _contactsListPageController => Get.find<ContactsListPageController>();

  UserServices get _userServices => Get.find<UserServices>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  EditContactArgument? _argument;

  @override
  void onInit() {
    super.onInit();
    _argument = Get.arguments;

    if (_argument != null) {
      firstName.text = _argument!.user.firstName;
      lastName.text = _argument!.user.lastName;
      email.text = _argument!.user.email ?? '';
      phone.text = _argument!.user.phone ?? '';
    }
  }

  onSave() {
    if (formKey.currentState?.validate() == true) {
      final userModelList = _contactsListPageController.userModel;
      if (_argument != null) {
        final userIdIndex = _contactsListPageController.userModel!.indexWhere((element) => element.id == _argument!.user.id);
        userModelList![userIdIndex] = userModelList[userIdIndex].copyWith(
          firstName: firstName.text,
          lastName: lastName.text,
          phone: phone.text,
          email: email.text,
        );
      } else {
        userModelList!.add(UserModel(
          id: generateRandomString(24),
          firstName: firstName.text,
          lastName: lastName.text,
          email: email.text,
          phone: phone.text,
        ));
      }

      _userServices.saveDataToLocal(userModelList);
      Get.back();
      _contactsListPageController.updateList();
    }
  }

  String generateRandomString(int len) {
    var rng = Random();
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[rng.nextInt(_chars.length)]).join();
  }
}
