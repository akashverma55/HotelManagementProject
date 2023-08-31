import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'circle.dart';

class explore_screen extends StatefulWidget {
  const explore_screen({super.key});

  @override
  State<explore_screen> createState() => _explore_screenState();
}

class _explore_screenState extends State<explore_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween<double>(begin: 0, end: 100).animate(_animationController)
      // _animation = 5
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    double _Progress = 70;
    return Scaffold(
        resizeToAvoidBottomInset: false,

        backgroundColor: Colors.blue[800],
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(children: [
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
                                  backgroundImage: AssetImage("Images/bg.jpg")),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi, Akash",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "23 jan, 2023",
                                    style: TextStyle(color: Colors.blue[100]),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.exit_to_app,
                              color: Colors.white, size: 30),
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
                        color: Colors.blue[400],
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("name of the hotel",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            height: Height * 0.15,
                            decoration: BoxDecoration(
                                // color: Colors.blueGrey[200],
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(children: [
                              Container(
                                // height: Height * 0.1,
                                width: Width * 0.1,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              SizedBox(
                                width: Width * 0.015,
                              ),
                              Expanded(
                                child: Container(
                                  // width: Width*0.5,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(12),
                                      image: DecorationImage(image: AssetImage("images/suitcase.jpg"),fit: BoxFit.cover)),
                                      
                                ),
                              ),
                              SizedBox(
                                width: Width * 0.015,
                              ),
                              CustomPaint(
                                
                                foregroundPainter: CircleProgress(_Progress),
                                child: Container(
                                    width: Width * 0.35,
                                    decoration: BoxDecoration(
                                        // color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(12),
                                            ),
                                    child: GestureDetector(
                                      onTap: () {
                                        _animationController.forward();
                                      },
                                      child: Center(
                                          child: Text(
                                              '${_Progress.toInt()}',
                                              style: TextStyle(fontSize: 20))),
                                    )),
                              ),
                            ]),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
