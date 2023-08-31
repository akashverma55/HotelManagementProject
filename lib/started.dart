import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hotel_management_app/Dashboard/Dashboard.dart';
class started extends StatefulWidget {
  const started({super.key});

  @override
  State<started> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<started> {
  final List<String> imagePaths = [
    'images/Hostel1.jpg',
    'images/Hostel2.jpg',
    'images/hostel3.png',

  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          CarouselSlider.builder(
            itemCount: imagePaths.length,
            itemBuilder: (context, index, realIndex) {
              return Image.asset(
                imagePaths[index],
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              );
            },
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
            ),
          ),
          Container(
            color: Colors.blueAccent.withOpacity(0.4),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/logo.jpg', // Replace with your app's logo image asset
                        height: 80,
                        width: 80,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Welcome to Hostel Management App',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Manage your hostels, track guest information, '
                        'and generate reports with ease.',
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Dashboard()),
                          );
                        },
                        child: Text('Get Started'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Text('Login Page'),
      ),
    );
  }
}