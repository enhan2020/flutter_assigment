import 'package:flutter_assignment/model/user_model.dart';
import 'package:flutter_assignment/services/user_services.dart';
import 'package:get/get.dart';

class ContactsListPageController extends GetxController {
  UserServices get _userServices => Get.find<UserServices>();

  List<UserModel?>? userModel;

  @override
  onReady() {
    super.onReady();
    onRefresh();
  }

  onRefresh() async {
    userModel = await _userServices.getUserJson();
    update();
  }
}
