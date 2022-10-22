import 'package:flutter_assignment/model/user_model.dart';
import 'package:flutter_assignment/services/user_services.dart';
import 'package:get/get.dart';

class ContactsListPageController extends GetxController {
  UserServices get _userServices => Get.find<UserServices>();

  List<UserModel>? userModel;

  @override
  void onInit() async {
    super.onInit();
    userModel = await _userServices.getDataFromLocal();
  }

  onRefresh() async {
    final initialData = await _userServices.getUserJson();
    await _userServices.saveDataToLocal(initialData);
    updateList();
  }

  updateList() async {
    userModel = await _userServices.getDataFromLocal();
    update();
  }
}
