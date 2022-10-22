import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/edit_contact_page_controller.dart';

class EditContactPage extends StatelessWidget {
  const EditContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditContactPageController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white12,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Text(
              "Cancel",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          actions: [
            InkWell(
              onTap: () => controller.onSave(),
              child: Text(
                "Save",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
        body: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: 100,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Text(
                  "Main Information",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Row(
                children: [
                  const Text("First Name"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: controller.firstName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "value cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 1,
              ),
              Row(
                children: [
                  const Text("Last Name"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: controller.lastName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "value cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 1,
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.grey[200],
                child: Text(
                  "Sub Information",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Row(
                children: [
                  const Text("Email"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: controller.email,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 1,
              ),
              Row(
                children: [
                  const Text("Phone"),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      controller: controller.phone,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                height: 1,
              ),
            ],
          ),
        ),
      );
    });
  }
}
