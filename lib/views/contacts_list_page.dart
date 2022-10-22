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
            centerTitle: true,
            title: const Text("Contacts", style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white70,
            leading: InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (context) => SearchDialog(
                  onSearch: (value) => controller.setSearchValue(value),
                  initialValue: controller.searchValue,
                ),
              ),
              child: Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
            ),
            actions: [
              InkWell(
                onTap: () => Get.toNamed(AppRoutes.editContactPage),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () => controller.onRefresh(),
            child: ListView.builder(
              itemCount: controller.filteredUserModel?.length ?? 0,
              itemBuilder: (context, index) {
                return ContactItem(user: controller.filteredUserModel![index]);
              },
            ),
          ),
        );
      },
    );
  }
}

class ContactItem extends StatelessWidget {
  final UserModel user;

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
                Text("${user.firstName} ${user.lastName}"),
              ],
            ),
            const Divider(thickness: 1),
          ],
        ),
      ),
    );
  }
}

class SearchDialog extends StatefulWidget {
  final String initialValue;
  final Function(String) onSearch;

  const SearchDialog({Key? key, required this.onSearch, required this.initialValue}) : super(key: key);

  @override
  State<SearchDialog> createState() => _SearchDialogState();
}

class _SearchDialogState extends State<SearchDialog> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    searchController.text = widget.initialValue;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Search"),
            TextFormField(
              controller: searchController,
            ),
            ElevatedButton(
              onPressed: () {
                widget.onSearch.call(searchController.text);
                Navigator.of(context).pop();
              },
              child: const Text("Search"),
            ),
          ],
        ),
      ),
    );
  }
}
