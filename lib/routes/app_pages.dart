import 'package:flutter_assignment/binding/edit_contact_page_binding.dart';
import 'package:flutter_assignment/views/contacts_list_page.dart';
import 'package:flutter_assignment/views/edit_contact_page.dart';
import 'package:get/get.dart';

import '../binding/contacts_list_page_binding.dart';
import 'app_routes.dart';

class AppPage {
  static final routes = [
    GetPage(
      name: AppRoutes.contactsListPage,
      page: () => const ContactsListPage(),
      binding: ContactsListPageBinding(),
    ),
    GetPage(
      name: AppRoutes.editContactPage,
      page: () => const EditContactPage(),
      binding: EditContactPageBinding(),
    ),
  ];
}
