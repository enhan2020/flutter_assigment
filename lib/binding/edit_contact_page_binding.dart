import 'package:flutter_assignment/controller/edit_contact_page_controller.dart';
import 'package:get/get.dart';

class EditContactPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditContactPageController());
  }
}
