import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';




class detail extends StatefulWidget {
  const detail({super.key});

  @override
  State<detail> createState() => _detailState();
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "Single Room", child: Text("Single Room")),
    const DropdownMenuItem(value: "Double Room", child: Text("Double Room")),
    const DropdownMenuItem(value: "Family Room", child: Text("Family Room")),
    const DropdownMenuItem(value: "Luxury Room", child: Text("Luxury Room")),
  ];
  return menuItems;
}

String selectedValue = "Single Room";

class _detailState extends State<detail> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    late String nameg, emailg, date, check, phoneN, aadharN;

    final H = MediaQuery.of(context).size.height;
    final W = MediaQuery.of(context).size.width;
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      // User is signed in
      final currentUserId = currentUser.uid;
      print('Current User ID: $currentUserId');
    } else {
      // No user is signed in
      print('No user signed in.');
    }
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, top: 45),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Container(
              //             height: H * 0.08,
              //             width: W,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(15),
              //               // image: DecorationImage(image: AssetImage()),
              //               color: Colors.blue,
              //             ),
              //             child: Row(children: [
              //               SizedBox(width: 10),
              //               // Expanded(
              //               //   child: Container(
              //               //       height: 50,
              //               //       width: 50,
              //               //       child: Row(
              //               //         mainAxisAlignment: MainAxisAlignment.center,
              //               //         children: [
              //               //           Text("Add Details",
              //               //               style: GoogleFonts.getFont("Roboto",
              //               //                   fontSize: 24,
              //               //                   fontWeight: FontWeight.w500)),
              //               //         ],
              //               //       )),
              //               // ),
              //               SizedBox(width: 10),
              //             ])),
              // SizedBox(height: 10),
              Container(
                  // color: Colors.amber,
                  height: H,
                  // width: W * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: AssetImage("images/hot1.jpg"),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: H * 0.88,
                          width: W * 0.95,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 20.0, left: 20, right: 20),
                                child: Text("Add Guest Details",
                                    style: GoogleFonts.getFont('Roboto',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700)),
                              ),
                              SizedBox(
                                height: H * 0.01,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(),
                                child: Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, right: 50, left: 50),
                                child: Text(
                                  "Enter the Guest Details.",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 30, right: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue[400],
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                            color:
                                                Colors.black.withOpacity(0.5))
                                      ]),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        nameg = val;
                                      });
                                    },
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.abc,
                                            color: Colors.white, size: 35),
                                        hintText: "Name of the Guest",
                                        hintStyle: TextStyle(
                                          color: Colors
                                              .white60, // Change the color here
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 30, right: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue[400],
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                            color:
                                                Colors.black.withOpacity(0.5))
                                      ]),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        emailg = val;
                                      });
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.mail,
                                          color: Colors.white,
                                        ),
                                        hintText: "Guest Email-ID",
                                        hintStyle: TextStyle(
                                          color: Colors
                                              .white60, // Change the color here
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 30, right: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue[400],
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                            color:
                                                Colors.black.withOpacity(0.5))
                                      ]),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        phoneN = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.white,
                                        ),
                                        hintText: "Guest PhoneNo.",
                                        hintStyle: TextStyle(
                                          color: Colors
                                              .white60, // Change the color here
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 30, right: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue[400],
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                            color:
                                                Colors.black.withOpacity(0.5))
                                      ]),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        aadharN = val;
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.account_box_rounded,
                                          color: Colors.white,
                                        ),
                                        hintText: "Guest Aadhar Number",
                                        hintStyle: TextStyle(
                                          color: Colors
                                              .white60, // Change the color here
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 30, right: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue[400],
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                            color:
                                                Colors.black.withOpacity(0.5))
                                      ]),
                                  child: DropdownButtonFormField(
                                      decoration: InputDecoration(
                                          labelText: 'Room Type',
                                          labelStyle: GoogleFonts.getFont(
                                            'Josefin Sans',
                                            color: Colors.white60,
                                          ),
                                          prefixIcon: const Icon(
                                            Icons.hotel,
                                            color: Colors.white,
                                          ),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.blueAccent,
                                                width: 3.0),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )),
                                      dropdownColor: Colors.white,
                                      value: selectedValue,
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          selectedValue = newValue!;
                                        });
                                      },
                                      items: dropdownItems),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 30, right: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue[400],
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                            color:
                                                Colors.black.withOpacity(0.5))
                                      ]),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        date = val;
                                      });
                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.calendar_month,
                                          color: Colors.white,
                                        ),
                                        hintText: "Booking Date",
                                        hintStyle: TextStyle(
                                          color: Colors
                                              .white60, // Change the color here
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10, left: 30, right: 30),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.blue[400],
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                            offset: Offset(1, 1),
                                            color:
                                                Colors.black.withOpacity(0.5))
                                      ]),
                                  child: TextField(
                                    onChanged: (val) {
                                      setState(() {
                                        check = val;
                                      });
                                    },
                                    keyboardType: TextInputType.datetime,
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.calendar_month_rounded,
                                          color: Colors.white,
                                        ),
                                        hintText: "Check-Out Date",
                                        hintStyle: TextStyle(
                                          color: Colors
                                              .white60, // Change the color here
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              RawMaterialButton(
                                onPressed: () {
                                  addGuestToUser(nameg, emailg, selectedValue);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, right: 30, top: 20, bottom: 20),
                                  child: Text(
                                    "SUBMIT",
                                    style: GoogleFonts.getFont('Roboto',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                fillColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.blue, width: 2.0),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              SizedBox(
                                height: 70,
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> addGuestToUser(String guestName, String guestEmail, String roomType) async {
  try {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final User? currentUser = _auth.currentUser;  

    if (currentUser != null) {
      final String currentUserId = currentUser.uid;
      // final CollectionReference userCollection = firestore.collection('users');
      // final DocumentReference userDocRef = userCollection.doc(currentUserId);

      // Generate a unique ID for the guest document
      // final String guestId = userDocRef.collection('guests').doc().id;

      // Create the guest document with the provided data
      // await userDocRef.collection('guests').doc(guestId).set({
        // 'name': guestName,
        // 'email': guestEmail,
        // 'roomType': roomType,
        // Add other guest details as needed
      // });

      print('Guest added successfully.');
    } else {
      print('No user is signed in.');
    }
  } catch (e) {
    print('Error adding guest: $e');
  }
}



// ...

// Check if a user is currently signed in
