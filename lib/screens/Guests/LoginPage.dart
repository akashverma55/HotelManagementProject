import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management_app/screens/Guests/HomePage.dart';
import 'package:hotel_management_app/screens/SignUpPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscured = true;
  bool _isLoggingIn = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller=TextEditingController();
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
            Positioned(
              top: 40, // Adjust the top position as needed
              left: 16, // Adjust the left position as needed
              child: Container(
                decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.2), // Background color
                shape: BoxShape.circle, // Circular shape
                ),
                child: IconButton(
                  color:Colors.grey,
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Handle back button press
                    Navigator.of(context).pop();
                  },
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
                        SizedBox(height: MediaQuery.of(context).size.height*0.015),
                        Text(
                          'Login Now',
                          style: GoogleFonts.getFont('Quicksand',
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                          )
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025),
                        TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            hintText: 'example01@gmail.com',
                            hintStyle: GoogleFonts.getFont('Josefin Sans',),
                            labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey),
                            prefixIcon: const Icon(Icons.person,color: Colors.blueGrey,),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02),
                        TextFormField(
                          controller: passwordcontroller,
                          obscureText: isObscured,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey),
                            prefixIcon: const Icon(Icons.lock,color: Colors.blueGrey,),
                            suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                isObscured = !isObscured;
                            });
                            },
                            child: Icon(isObscured ? Icons.visibility_off : Icons.visibility,color: Colors.blueAccent,),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                              borderRadius: BorderRadius.circular(20),
                            )
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.03),
                        _isLoggingIn? const CircularProgressIndicator():ElevatedButton(
                          onPressed: () {
                            _signIn();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.012),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Center(
                              child: Text('Login', style: GoogleFonts.getFont('Lato',fontSize: 18)),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.blueGrey)
                                )
                              ),
                              child: SizedBox(
                                width:MediaQuery.of(context).size.width*0.25,
                                height: MediaQuery.of(context).size.height*0.05,
                                child: const Image(image: AssetImage('images/google_logo.png')),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.1,),
                            ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: const BorderSide(color: Colors.blueGrey)
                                )
                              ),
                              child: SizedBox(
                                width:MediaQuery.of(context).size.width*0.25,
                                height: MediaQuery.of(context).size.height*0.05,
                                child: const Image(image: AssetImage('images/facebooklogo.png')),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("For new account?",
                              style: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey,fontSize: 18)),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUpPage()));
                            },
                            child: Text(
                              "Register Here",
                              style: GoogleFonts.getFont('Josefin Sans',color: Colors.blueAccent,fontSize: 20),
                            ))
                          ],
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
  Future<void> _signIn() async{
    final email = emailcontroller.text;
    final password = passwordcontroller.text;
    setState(() {
      _isLoggingIn = true;
    });
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login successful! Welcome to the Dashboard.'),
        backgroundColor: Colors.green,
      ),
    );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Login failed. Please check your credentials.'),
        backgroundColor: Colors.red,
      ),
    );
    }
    finally {
      setState(() {
        _isLoggingIn = false;
      });
    }
  }
}