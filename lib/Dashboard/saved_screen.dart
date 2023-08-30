import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class saved_screen extends StatefulWidget {
  const saved_screen({super.key});

  @override
  State<saved_screen> createState() => _saved_screenState();
}

class _saved_screenState extends State<saved_screen> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        // color: Colors.redAccent,
        height: Height,
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: Height * 0.05,
            ),
            Row(
              children: [
                SizedBox(
                  width: Width * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 15, 15, 15).withOpacity(0.7),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                      radius: 35, backgroundImage: AssetImage("Images/bg.jpg")),
                ),
                SizedBox(
                  width: Width * 0.05,
                ),
                Text("Akash Kumar Verma",
                    style: GoogleFonts.getFont('Sedgwick Ave Display',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Expanded(
                  child: Container(decoration: BoxDecoration(
                    
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Icon(
                            Icons.exit_to_app,
                            size: 40,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Divider(
              thickness: 4,
              color: Colors.black,
            ),
            
          ]),
        ),
      ),
    );
  }
}
