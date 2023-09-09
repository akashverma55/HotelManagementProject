import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'circle.dart';
import 'Circles.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

List ima = [
  "images/grdt.jpg",
  "images/grdt2.jpg",
  "images/grdt4.jpg",
];

class _home_screenState extends State<home_screen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    double _Progress = 70;
    int men = 5;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            // image: DecorationImage(
            //     image: AssetImage("images/grdt.jpg"), fit: BoxFit.cover)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 15, 15, 15)
                                            .withOpacity(0.7),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: 35,
                                    backgroundImage:
                                        AssetImage("images/cat.jpg"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Hi, Akash",
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      // SizedBox(
                                      //   height: 8,
                                      // ),
                                      // Text(
                                      //   "23 Jan, 2023",
                                      //   style:
                                      //       TextStyle(color: Colors.blue[400]),
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              border: Border.all(color: const Color.fromARGB(255, 162, 206, 241), width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(Icons.exit_to_app,
                                  color: Colors.white, size: 28),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: Width * 0.8,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                "Name of the Hotel",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Align(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, right: 8, left: 8),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                          color: Colors.white,
                        ),
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
                  width: Width,
                  height: Height * 0.65,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: 1,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                height: Height * 0.65,
                                width: Width * 0.6,
                                // margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(ima[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(height: Height * 0.01),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 20, bottom: 10),
                                        child: Text("GUEST INFO",
                                            style: GoogleFonts.getFont('Roboto',
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                            height: Height * 0.25,
                                            width: Width * 0.9,
                                            child: Row(children: [
                                              SizedBox(
                                                width: Width * 0.05,
                                              ),
                                              Container(
                                                  height: Height * 0.2,
                                                  width: Width * 0.35,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.black,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "images/traveler.png"),
                                                          fit: BoxFit.cover))),
                                              SizedBox(width: Width * 0.1),
                                              CustomPaint(
                                                foregroundPainter:
                                                    CircleProgress(_Progress),
                                                child: Container(
                                                    width: Width * 0.35,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // _animationController.forward();
                                                      },
                                                      child: Center(
                                                          child: Text(
                                                              '${_Progress.toInt()}%',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20))),
                                                    )),
                                              ),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: Height * 0.01,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 30),
                                        child: Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Total Guest Capacity: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  //   Icon(
                                                  //       Icons
                                                  //           .radio_button_checked_sharp,
                                                  //       color: Colors.white,
                                                  //       size: 25),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Total No Of Guest: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  Icon(Icons.brightness_1,
                                                      color: Colors.blue,
                                                      size: 25),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("No Of Vaccancy: ${men}",
                                                             style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  Icon(Icons.brightness_1,
                                                      color: Colors.black,
                                                      size: 25),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("No Of Males: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("No Of Females: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("No Of Children: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                ],
                                              )
                                            ])),
                                      )
                                    ])),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 1,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                height: Height * 2.2,
                                width: Width * 0.6,
                                // margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(ima[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(height: Height * 0.01),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 20, bottom: 10),
                                        child: Text("ROOMS INFO",
                                            style: GoogleFonts.getFont('Roboto',
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                            // decoration: BoxDecoration(
                                            //     // borderRadius: BorderRadius.only(
                                            //     //   topLeft: Radius.circular(30),
                                            //     //   bottomRight:
                                            //     //       Radius.circular(30),
                                            //     // ),
                                            //     border: Border.all(
                                            //         color: Colors.white,
                                            //         width: 5)),
                                            height: Height * 0.25,
                                            width: Width * 0.9,
                                            child: Row(children: [
                                              SizedBox(
                                                width: Width * 0.05,
                                              ),
                                              Container(
                                                  height: Height * 0.2,
                                                  width: Width * 0.4,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.black,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "images/beds.png"),
                                                          fit: BoxFit.cover))),
                                              SizedBox(width: Width * 0.07),
                                              CustomPaint(
                                                foregroundPainter:
                                                    CircleProgress(_Progress),
                                                child: Container(
                                                    width: Width * 0.35,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // _animationController.forward();
                                                      },
                                                      child: Center(
                                                          child: Text(
                                                              '${_Progress.toInt()}%',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20))),
                                                    )),
                                              ),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: Height * 0.01,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 30),
                                        child: Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Total No Of Rooms: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Rooms Filled: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  Icon(Icons.brightness_1,
                                                      color: Colors.blue,
                                                      size: 25),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Rooms Vaccant: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  Icon(Icons.brightness_1,
                                                      color: Colors.black,
                                                      size: 25),
                                                ],
                                              ),
                                              SizedBox(
                                                height: Height * 0.05,
                                              ),
                                              Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                      height: 300,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Colors.teal,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(children: [
                                                        SizedBox(height: 10),
                                                        Text("Single Rooms",
                                                            style: GoogleFonts
                                                                .getFont(
                                                                    'Roboto',
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: Colors
                                                                        .black)),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 40.0,
                                                                    left: 10,
                                                                    top: 20),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Image(
                                                                        image: AssetImage(
                                                                            "images/single.png")),
                                                                  ),
                                                                  Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    child:
                                                                        CustomPaint(
                                                                      foregroundPainter:
                                                                          CircleProg(
                                                                              _Progress),
                                                                      child: Container(
                                                                          width: Width * 0.35,
                                                                          decoration: BoxDecoration(
                                                                            // color: Colors.blue,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                          child: GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              // _animationController.forward();
                                                                            },
                                                                            child:
                                                                                Center(child: Text('${_Progress.toInt()}%', style: TextStyle(fontSize: 20))),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Total No Of Single Rooms: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Filled: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .blue,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Vaccant: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .black,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ])),
                                                ],
                                              )),
                                              SizedBox(
                                                height: Height * 0.05,
                                              ),
                                              Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      height: 300,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Colors.teal,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(children: [
                                                        SizedBox(height: 10),
                                                        Text("Double Rooms",
                                                            style: GoogleFonts
                                                                .getFont(
                                                                    'Roboto',
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: Colors
                                                                        .black)),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 30.0,
                                                                    left: 10,
                                                                    top: 20),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Image(
                                                                        image: AssetImage(
                                                                            "images/double.png")),
                                                                  ),
                                                                  Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    child:
                                                                        CustomPaint(
                                                                      foregroundPainter:
                                                                          CircleProg(
                                                                              _Progress),
                                                                      child: Container(
                                                                          width: Width * 0.35,
                                                                          decoration: BoxDecoration(
                                                                            // color: Colors.blue,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                          child: GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              // _animationController.forward();
                                                                            },
                                                                            child:
                                                                                Center(child: Text('${_Progress.toInt()}%', style: TextStyle(fontSize: 20))),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Total No Of Double Rooms: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Filled: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .blue,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Vaccant: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .blue,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ])),
                                                ],
                                              )),
                                              SizedBox(
                                                height: Height * 0.05,
                                              ),
                                              Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      height: 300,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Colors.teal,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(children: [
                                                        SizedBox(height: 10),
                                                        Text("Fmaily Rooms",
                                                            style: GoogleFonts
                                                                .getFont(
                                                                    'Roboto',
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: Colors
                                                                        .black)),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 40.0,
                                                                    left: 10,
                                                                    top: 20),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Image(
                                                                        image: AssetImage(
                                                                            "images/family.png")),
                                                                  ),
                                                                  Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    child:
                                                                        CustomPaint(
                                                                      foregroundPainter:
                                                                          CircleProg(
                                                                              _Progress),
                                                                      child: Container(
                                                                          width: Width * 0.35,
                                                                          decoration: BoxDecoration(
                                                                            // color: Colors.blue,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                          child: GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              // _animationController.forward();
                                                                            },
                                                                            child:
                                                                                Center(child: Text('${_Progress.toInt()}%', style: TextStyle(fontSize: 20))),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Total No Of Family Rooms: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Filled: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .blue,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Vaccant: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .blue,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ])),
                                                ],
                                              )),
                                              SizedBox(
                                                height: Height * 0.05,
                                              ),
                                              Container(
                                                  child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      height: 300,
                                                      width: 250,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          border: Border.all(
                                                            color: Colors.teal,
                                                            width: 2,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(children: [
                                                        SizedBox(height: 10),
                                                        Text("Luxury Rooms",
                                                            style: GoogleFonts
                                                                .getFont(
                                                                    'Roboto',
                                                                    fontSize:
                                                                        20,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: Colors
                                                                        .black)),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    right: 30.0,
                                                                    left: 10,
                                                                    top: 20),
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    height: 100,
                                                                    width: 100,
                                                                    child: Image(
                                                                        image: AssetImage(
                                                                            "images/luxury.png")),
                                                                  ),
                                                                  Container(
                                                                    height: 60,
                                                                    width: 60,
                                                                    child:
                                                                        CustomPaint(
                                                                      foregroundPainter:
                                                                          CircleProg(
                                                                              _Progress),
                                                                      child: Container(
                                                                          width: Width * 0.35,
                                                                          decoration: BoxDecoration(
                                                                            // color: Colors.blue,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12),
                                                                          ),
                                                                          child: GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              // _animationController.forward();
                                                                            },
                                                                            child:
                                                                                Center(child: Text('${_Progress.toInt()}%', style: TextStyle(fontSize: 20))),
                                                                          )),
                                                                    ),
                                                                  ),
                                                                ]),
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(20.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Total No Of Luxury Rooms: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Filled: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .blue,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                    height: 10),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "Rooms Vaccant: ${men}",
                                                                        style: GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            fontSize:
                                                                                16,
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                            color: Colors.black)),
                                                                    Icon(
                                                                        Icons
                                                                            .brightness_1,
                                                                        color: Colors
                                                                            .blue,
                                                                        size:
                                                                            25),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ])),
                                                ],
                                              )),
                                            ])),
                                      )
                                    ])),
                          );
                        },
                      ),
                      ListView.builder(
                        itemCount: 1,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                                height: Height * 0.65,
                                width: Width * 0.6,
                                // margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  // color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage(ima[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // SizedBox(height: Height * 0.01),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 20, bottom: 10),
                                        child: Text("SERVICES INFO",
                                            style: GoogleFonts.getFont('Roboto',
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                            // decoration: BoxDecoration(
                                            //     borderRadius: BorderRadius.only(
                                            //       topLeft: Radius.circular(30),
                                            //       bottomRight:
                                            //           Radius.circular(30),
                                            //     ),
                                            //     border: Border.all(
                                            //         color: Colors.white,
                                            //         width: 5)),
                                            height: Height * 0.25,
                                            width: Width * 0.9,
                                            child: Row(children: [
                                              SizedBox(
                                                width: Width * 0.05,
                                              ),
                                              Container(
                                                  height: Height * 0.2,
                                                  width: Width * 0.3,
                                                  decoration: BoxDecoration(
                                                      // color: Colors.black,
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              "images/waiter.png"),
                                                          fit: BoxFit.cover))),
                                              SizedBox(width: Width * 0.15),
                                              CustomPaint(
                                                foregroundPainter:
                                                    CircleProgress(_Progress),
                                                child: Container(
                                                    width: Width * 0.35,
                                                    decoration: BoxDecoration(
                                                      // color: Colors.blue,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        // _animationController.forward();
                                                      },
                                                      child: Center(
                                                          child: Text(
                                                              '${_Progress.toInt()}%',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      20))),
                                                    )),
                                              ),
                                            ])),
                                      ),
                                      SizedBox(
                                        height: Height * 0.01,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, right: 30),
                                        child: Container(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Total No Of Services: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  //   Icon(
                                                  //       Icons
                                                  //           .radio_button_checked_sharp,
                                                  //       color: Colors.white,
                                                  //       size: 25),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Services Completed: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  Icon(Icons.brightness_1,
                                                      color: Colors.blue,
                                                      size: 25),
                                                ],
                                              ),
                                              SizedBox(height: Height * 0.01),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      "Services To Be Completed: ${men}",
                                                      style:
                                                          GoogleFonts.getFont(
                                                              'Roboto',
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: Colors
                                                                  .black)),
                                                  Icon(Icons.brightness_1,
                                                      color: Colors.black,
                                                      size: 25),
                                                ],
                                              )
                                            ])),
                                      )
                                    ])),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
