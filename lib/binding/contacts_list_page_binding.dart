import 'package:flutter_assignment/controller/contacts_list_page_controller.dart';
import 'package:get/get.dart';

class ContactsListPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContactsListPageController());
  }
}
