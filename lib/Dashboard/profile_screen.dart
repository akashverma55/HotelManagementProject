import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth.dart';

class profile_screen extends StatefulWidget {
  const profile_screen({super.key});

  @override
  State<profile_screen> createState() => _profile_screenState();
}

class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    final H = MediaQuery.of(context).size.height;
    final W = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
            height: H,
            width: W,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/hotel1.jpg"), fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: H * 0.85,
                    width: W * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.teal, width: 3)),
                    child: Column(
                      children: [
                      
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            height: 50,
                            width: W,
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                              GestureDetector(
                                onTap: () {
            _showEditPageBottomSheet(context);
          },
                                child: Icon(Icons.edit_square,size:30,color: Colors.teal)),
                            ],)
                          ),
                        ),
                        SizedBox(height: H * 0.05),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 15, 15, 15)
                                    .withOpacity(0.7),
                                spreadRadius: 6,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: 
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: AssetImage("images/cat.jpg"),
                          ),
                        ),
                        SizedBox(height: 50),
                        Text("Akash Kumar Verma",
                            style: GoogleFonts.getFont(
                              'Roboto',
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            )),
                        SizedBox(height: 1),
                        Padding(
                          padding: const EdgeInsets.only(right: 20, left: 20),
                          child: Divider(color: Colors.black, thickness: 2),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Container(
                                  child: Icon(Icons.email,
                                      size: 30, color: Colors.black45)),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "AkvAkv150@gmail.com",
                              style: GoogleFonts.getFont('Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 40),
                              child: Container(
                                  child: Icon(Icons.phone,
                                      size: 30, color: Colors.black45)),
                            ),
                            SizedBox(width: 20),
                            Text(
                              "626509254",
                              style: GoogleFonts.getFont('Roboto',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 100),
                        RawMaterialButton(
                          onPressed: () {
                            AuthController.instance.Signout();
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 15, bottom: 15),
                            child: Text(
                              "Sign Out",
                              style:
                                  TextStyle(color: Color.fromARGB(255, 13, 102, 175), fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                          ),
                          fillColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Color.fromARGB(255, 13, 102, 175),width: 3),
                              borderRadius: BorderRadius.circular(10)),
                        )
                      ],
                    ))
              ],
            )));
  }
}
void _showEditPageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Edit Your Name'),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: '',
                  ),
                  maxLines: null, // Allows multiple lines
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // You can add code here to save the edited page content
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
