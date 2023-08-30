import 'package:flutter/material.dart';
import 'package:hotel_management_app/Dashboard/explore_screen.dart';
import 'package:hotel_management_app/Dashboard/profile_screen.dart';
import 'package:hotel_management_app/Dashboard/home_screen.dart';
import 'package:hotel_management_app/Dashboard/saved_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _miniState();
}

int indexValue = 0;

class _miniState extends State<Dashboard> {
  List screen = [
    home_screen(),
    explore_screen(),
    saved_screen(),
    profile_screen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: Colors.black,
        unselectedItemColor: Colors.blueGrey,
        // unselectedLabelStyle: TextStyle(color: Colors.blue),
        selectedItemColor: Colors.blue,
        currentIndex: indexValue,
        onTap: (value) {
          setState(() {
            indexValue = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_rounded), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.sms), label: "Message"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: screen[indexValue],
    );
  }
}
