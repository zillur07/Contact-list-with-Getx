import 'package:contuct_list_getx/src/models/contactModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CantactController extends GetxController {
  final fullName = ''.obs;
  final phoneNumber = ''.obs;
  final email = ''.obs;
  final address = ''.obs;

  final contacts = RxList<ContactModel>();

  void addContuct() {
    final contactData = ContactModel(
      id: Uuid().v1(),
      email: email.value,
      name: fullName.value,
      phoneNumber: phoneNumber.value,
      address: address.value,
      imageUrl: 'img/image_p.webp',
    );
    contacts.add(contactData);
    Get.back();
  }

  // void deleteContact({required String id}) {
  //   contacts.removeWhere((item) => item.id == id);
  // }

  void deleteContact({required String id}) {
    Get.defaultDialog(middleText: 'Are you sure', actions: [
      // ignore: deprecated_member_use
      FlatButton(
        color: Colors.grey,
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cencal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      FlatButton(
        color: Colors.red,
        onPressed: () {
          contacts.removeWhere((item) => item.id == id);
          Get.back();
          Get.snackbar(
            'Successfully',
            'Contact Number is Delete',
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.done,
            ),
            colorText: Colors.black,
            snackPosition: SnackPosition.TOP,
          );
        },
        child: Text(
          'Confirm',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ]);
  }

  void editContact({required String id}) {
    final updateData = ContactModel(
      id: Uuid().v1(),
      email: email.value,
      name: fullName.value,
      phoneNumber: phoneNumber.value,
      address: address.value,
      imageUrl: 'img/image_p.webp',
    );
    contacts[contacts.indexWhere((contactItem) => contactItem.id == id)] =
        updateData;

    Get.back();
    Get.snackbar(
      'Successfully',
      'Contact Number is Update',
      backgroundColor: Colors.red[300],
      icon: Icon(
        Icons.done_all,
      ),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );
  }
}
