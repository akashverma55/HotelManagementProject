import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_management_app/Dashboard/Dashboard.dart';

class saved_screen extends StatefulWidget {
  const saved_screen({super.key});

  @override
  State<saved_screen> createState() => _saved_screenState();
}

List ima = [
  "images/hotel.jpg",
  "images/Hostel2.jpg",
  "images/Hostel3.jpg",
];
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

class _saved_screenState extends State<saved_screen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    late String nameh;
    late int tn, sn, dn, fn, ln;
    final H = MediaQuery.of(context).size.height;
    final W = MediaQuery.of(context).size.width;
   


    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                  height: H * 0.08,
                  width: W,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    // image: DecorationImage(image: AssetImage()),
                    color: Colors.blue,
                  ),
                  child: Row(children: [
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                          height: 50,
                          width: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Add Details",
                                  style: GoogleFonts.getFont("Roboto",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500)),
                            ],
                          )),
                    ),
                    SizedBox(width: 10),
                  ])),
              SizedBox(height: H * 0.01),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,                                                                                               
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                child: Align(
                  // alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                    child: TabBar(
                      controller: _tabController,
                      // isScrollable: true,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          color: Colors.white),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.white,
                      tabs: [
                        Tab(text: "Guest"),
                        Tab(text: "Rooms"),
                        Tab(text: "Services"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  width: W * 0.9,
                  height: H * 0.72,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                          itemCount: 1,
                          itemBuilder: (_, index) {
                            return Container(
                                // color: Colors.amber,
                                height: H * 0.72,
                                // width: W * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage("images/hot.jpg"),
                                        fit: BoxFit.cover)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: H * 0.6,
                                      width: W * 0.8,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Text("Add Guest Detail",
                                                style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700)),
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
                                              "Enter the details of the guest.",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // nameh = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.abc,
                                                        color: Colors.white,
                                                        size: 35),
                                                    hintText:
                                                        "Name of the Guest",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.emailAddress,
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
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
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
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.account_box_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    hintText:
                                                        "Guest Aadhar Number",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: DropdownButtonFormField(
                                                  decoration: InputDecoration(
                                                      labelText: 'Room Type',
                                                      labelStyle:
                                                          GoogleFonts.getFont(
                                                        'Josefin Sans',
                                                        color: Colors.white60,
                                                      ),
                                                      prefixIcon: const Icon(
                                                        Icons.hotel,
                                                        color: Colors.white,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .blueAccent,
                                                                width: 3.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      )),
                                                  dropdownColor: Colors.white,
                                                  value: selectedValue,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      selectedValue = newValue!;
                                                    });
                                                  },
                                                  items: dropdownItems),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.datetime,
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
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.datetime,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons
                                                          .calendar_month_rounded,
                                                      color: Colors.white,
                                                    ),
                                                    hintText: "Check-Out Date",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          RawMaterialButton(
                                            onPressed: () {
                                              // if (password == passwd2) {
                                              //   OnUserRegister();
                                              //   crtusrinDb(name, email, password);
                                              // } else {
                                              //   Fluttertoast.showToast(msg: "Password is not Same");
                                              // }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30,
                                                  right: 30,
                                                  top: 20,
                                                  bottom: 20),
                                              child: Text(
                                                "SUBMIT",
                                                style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                      ListView.builder(
                          itemCount: 1,
                          itemBuilder: (_, index) {
                            return Container(
                                // color: Colors.amber,
                                height: H * 0.72,
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
                                    Container(
                                      height: H * 0.6,
                                      width: W * 0.8,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Text("Add Room Details",
                                                style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700)),
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
                                              "Enter the details of rooms.",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  
                                                    nameh = val;
                                                  
                                                },
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.abc,
                                                        color: Colors.white,
                                                        size: 35),
                                                    hintText:
                                                        "Name Of the Hotel",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    tn = int.parse(val);
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.hotel,
                                                      color: Colors.white,
                                                    ),
                                                    hintText:
                                                        "Total Number Of Rooms",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    sn = int.parse(val);
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.hotel,
                                                      color: Colors.white,
                                                    ),
                                                    hintText:
                                                        "Number Of Single Rooms",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    dn = int.parse(val);
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.hotel,
                                                      color: Colors.white,  
                                                    ),
                                                    hintText:
                                                        "Number Of Double Rooms",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    fn = int.parse(val);
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.hotel,
                                                      color: Colors.white,
                                                    ),
                                                    hintText:
                                                        "Number Of Family Rooms",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    ln = int.parse(val);
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.hotel,
                                                      color: Colors.white,
                                                    ),
                                                    hintText:
                                                        "Number Of Luxury Rooms",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          RawMaterialButton(
                                            onPressed: () {
                                              // addGuestDataToFirestore();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) => Dashboard(
                                                      indexValue:
                                                          0), // Pass the initial index
                                                ),
                                              );
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30,
                                                  right: 30,
                                                  top: 20,
                                                  bottom: 20),
                                              child: Text(
                                                "SUBMIT",
                                                style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                      ListView.builder(
                          itemCount: 1,
                          itemBuilder: (_, index) {
                            return Container(
                                // color: Colors.amber,
                                height: H * 0.72,
                                // width: W * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage("images/hot3.jpg"),
                                        fit: BoxFit.cover)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: H * 0.6,
                                      width: W * 0.8,
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.7),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Text("Add Guest Services",
                                                style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700)),
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
                                              "Enter the details of the guest.",
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black87,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.abc,
                                                        color: Colors.white,
                                                        size: 35),
                                                    hintText:
                                                        "Name of the Guest",
                                                    hintStyle: TextStyle(
                                                      color: Colors.white60,
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: DropdownButtonFormField(
                                                  decoration: InputDecoration(
                                                      labelText: 'Room Type',
                                                      labelStyle:
                                                          GoogleFonts.getFont(
                                                        'Josefin Sans',
                                                        color: Colors.white60,
                                                      ),
                                                      prefixIcon: const Icon(
                                                        Icons.hotel,
                                                        color: Colors.white,
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .blueAccent,
                                                                width: 3.0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      )),
                                                  dropdownColor: Colors.white,
                                                  value: selectedValue,
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      selectedValue = newValue!;
                                                    });
                                                  },
                                                  items: dropdownItems),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.pin,
                                                      color: Colors.white,
                                                    ),
                                                    hintText: "Room Number",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                bottom: 10,
                                                left: 30,
                                                right: 30),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.blue[400],
                                                  boxShadow: [
                                                    BoxShadow(
                                                        blurRadius: 5,
                                                        spreadRadius: 1,
                                                        offset: Offset(1, 1),
                                                        color: Colors.black
                                                            .withOpacity(0.5))
                                                  ]),
                                              child: TextField(
                                                onChanged: (val) {
                                                  setState(() {
                                                    // name = val;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.name,
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                      Icons.room_service,
                                                      color: Colors.white,
                                                    ),
                                                    hintText:
                                                        "Write your Services",
                                                    hintStyle: TextStyle(
                                                      color: Colors
                                                          .white60, // Change the color here
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Colors
                                                                    .white))),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          RawMaterialButton(
                                            onPressed: () {
                                              // if (password == passwd2) {
                                              //   OnUserRegister();
                                              //   crtusrinDb(name, email, password);
                                              // } else {
                                              //   Fluttertoast.showToast(msg: "Password is not Same");
                                              // }
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30,
                                                  right: 30,
                                                  top: 20,
                                                  bottom: 20),
                                              child: Text(
                                                "SUBMIT",
                                                style: GoogleFonts.getFont(
                                                    'Roboto',
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            fillColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2.0),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          )
                                        ]),
                                      ),
                                    ),
                                  ],
                                ));
                          }),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
