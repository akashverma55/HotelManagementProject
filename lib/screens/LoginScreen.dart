import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management_app/screens/Guests/LoginPage.dart';
import 'package:hotel_management_app/screens/Manager/LoginScreenManager.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height*0.02, 0, MediaQuery.of(context).size.height*0.13),
                  width: double.infinity,
                  height: 400,
                  child: Image.asset(
                    'images/HotelBooking2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height-320,
                  width: MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(40.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'GuestGlide',
                            style: GoogleFonts.getFont('Source Sans Pro',
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                            )
                          ),
                        ),
                        const Divider(thickness: 3,indent: 50,endIndent: 50,),
                        Text(
                          'Seamlessly Managed Stays',
                          style: GoogleFonts.getFont('Shadows Into Light',
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black54
                          )
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.1),
                        ElevatedButton(
                          onPressed: () {
                            // Handle login logic here
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.012),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Center(
                              child: Text('Continue as Guest', style: GoogleFonts.getFont('Work Sans',fontSize: 24)),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03),
                        ElevatedButton(
                          onPressed: () {
                            // Handle login logic here
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginScreenManager()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              side: const BorderSide(width: 2.0,color: Colors.blueAccent),
                            ),
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.012),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Center(
                              child: Text('Continue as Manager', style: GoogleFonts.getFont('Work Sans',fontSize: 24,color: Colors.blueAccent)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}