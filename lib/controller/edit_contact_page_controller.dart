import 'package:flutter/material.dart';
import 'package:flutter_assignment/routes/arguments.dart';
import 'package:get/get.dart';

class EditContactPageController extends GetxController {
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
      firstName.text = _argument!.user.lastName;
      firstName.text = _argument!.user.email;
      firstName.text = _argument!.user.phone;
    }
  }

  onSave() {
    print('uyes');
  }
}
