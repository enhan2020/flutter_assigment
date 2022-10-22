import 'package:flutter/material.dart';
import 'package:flutter_assignment/controller/contacts_list_page_controller.dart';
import 'package:flutter_assignment/model/user_model.dart';
import 'package:flutter_assignment/routes/app_routes.dart';
import 'package:flutter_assignment/routes/arguments.dart';
import 'package:get/get.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ContactsListPageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Contacts", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white70,
            leading: Icon(
              Icons.search,
              color: Theme.of(context).primaryColor,
            ),
            actions: [
              Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
            child: ListView.builder(
              itemCount: controller.userModel?.length ?? 0,
              itemBuilder: (context, index) {
                return ContactItem(user: controller.userModel![index]);
              },
            ),
          ),
        );
      },
    );
  }
}

class ContactItem extends StatelessWidget {
  final UserModel? user;

  const ContactItem({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(AppRoutes.editContactPage, arguments: EditContactArgument(user)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                const SizedBox(width: 10),
                Text("${user?.firstName} ${user?.lastName}"),
              ],
            ),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}
