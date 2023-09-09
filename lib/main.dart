import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hotel_management_app/Dashboard/auth.dart';
import 'package:hotel_management_app/Dashboard/home_screen.dart';
import 'package:hotel_management_app/started.dart';
import 'package:hotel_management_app/Dashboard/Dashboard.dart';
import 'package:get/get.dart';
import 'package:hotel_management_app/Dashboard/detail.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: started()
    );
  }
}
