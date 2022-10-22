import 'package:flutter/material.dart';
import 'package:flutter_assignment/controller/contacts_list_page_controller.dart';
import 'package:flutter_assignment/routes/arguments.dart';
import 'package:get/get.dart';

class EditContactPageController extends GetxController {
  ContactsListPageController get _contactsListPageController => Get.find<ContactsListPageController>();

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
      email.text = _argument!.user.email;
      phone.text = _argument!.user.phone;
    }
  }

  onSave() {
    if (formKey.currentState?.validate() == true) {
      final userModelList = _contactsListPageController.userModel;
      var userModel = _contactsListPageController.userModel!.firstWhere((element) => element.id == _argument!.user.id);
      userModel = userModel.copyWith(
        firstName: firstName.text,
        lastName: lastName.text,
        email: email.text,
        phone: phone.text,
      );

      _contactsListPageController.userModel = userModelList;
      Get.back();
      _contactsListPageController.update();
    }
  }
}
