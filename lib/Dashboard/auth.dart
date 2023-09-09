import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel_management_app/started.dart';
import 'package:hotel_management_app/Dashboard/Dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  late FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    auth.currentUser;
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => started());
    } else {
      Get.off(() => Dashboard(indexValue: 0));
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar("About User", "User message",
          backgroundColor: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          titleText: Text(
            "Account Creation Failed",
            style: TextStyle(color: Colors.blue),
          ),
          messageText: Text(
            e.toString(),
            style: TextStyle(color: Colors.blue),
          ));
    }
  }

  void Signout() async {
    await auth.signOut();
  }
}
