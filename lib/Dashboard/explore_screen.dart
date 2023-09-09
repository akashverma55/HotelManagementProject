import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'circle.dart';

class explore_screen extends StatefulWidget {
  const explore_screen({super.key});

  @override
  State<explore_screen> createState() => _explore_screenState();
}

class _explore_screenState extends State<explore_screen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final H = MediaQuery.of(context).size.height;
    final W = MediaQuery.of(context).size.width;
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
                height: H * 0.08,
                width: W * 0.95,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // image: DecorationImage(image: AssetImage()),
                  color: Colors.blue,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Details of Hotel",
                          style: GoogleFonts.getFont("Roboto",
                              fontSize: 24, fontWeight: FontWeight.w500)),
                    ])),
            SizedBox(
              height: 10,
            ),
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

                      Tab(text: "Services"),
                      // Tab(text: "Services"),
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
                            height: H * 0.5,
                            width: W * 0.5,
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("images/hot.jpg"),
                                    fit: BoxFit.cover)),
                            //
                          );
                        }),
                    ListView.builder(
                        itemCount: 1,
                        itemBuilder: (_, index) {
                          return Container(
                            // color: Colors.amber,
                            height: H * 0.5,
                            width: W * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("images/hot.jpg"))),
                          );
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
