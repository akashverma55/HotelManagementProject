import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_management_app/screens/Manager/LoginPage.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final PageController _pageController = PageController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "USA", child: Text("USA")),
    const DropdownMenuItem(value: "Canada", child: Text("Canada")),
    const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
    const DropdownMenuItem(value: "England", child: Text("England")),
  ];
  return menuItems;
  }
  String selectedValue = "USA";
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _hotelNameController = TextEditingController();
  
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  int _currentPageIndex = 0;
  void _nextPage() {
    if (_formKey.currentState!.validate()) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  void _previousPage() {
    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
  void _registerManager() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      // Perform additional steps like storing manager's details in a database
      // and navigating to the manager's dashboard

      _showSuccessSnackbar('Registration successful! Welcome to the app.');
    } catch (e) {
      _showErrorSnackbar('Registration failed. Please check your details.');
    }
  }

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
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
                  child: Form(
                      key: _formKey,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPageIndex = index;
                          });
                        },
                        children: [
                          _buildPageOne(),
                          _buildPageTwo(),
                        ],
                      ),
                    ),
                  )
                  )
              )]
            )
        )
      );
  }
  Widget _buildPageOne() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.015),
          Text(
            'Register Here',
            style: GoogleFonts.getFont('Quicksand',
            fontSize: 25,
            fontWeight: FontWeight.bold
            )
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.025),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey),
                              prefixIcon: const Icon(Icons.person,color: Colors.blueGrey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                                borderRadius: BorderRadius.circular(20),
                              )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.025),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email',
                              hintText: 'example01@gmail.com',
                              hintStyle: GoogleFonts.getFont('Josefin Sans',),
                              labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey),
                              prefixIcon: const Icon(Icons.email,color: Colors.blueGrey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                                borderRadius: BorderRadius.circular(20),
                              )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.025),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(labelText: 'Phone Number',
                              labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey),
                              prefixIcon: const Icon(Icons.email,color: Colors.blueGrey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                                borderRadius: BorderRadius.circular(20),
                              )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a phone number';
                }
                // Implement more specific phone number validation if needed
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.025),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: TextFormField(
              controller: _hotelNameController,
              decoration: InputDecoration(
                              labelText: 'Hotel Name',labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey,),
                              prefixIcon: const Icon(Icons.hotel,color: Colors.blueGrey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                                borderRadius: BorderRadius.circular(20),
                              )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the hotel name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03),
          ElevatedButton(
            onPressed: _nextPage,
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
                              child: Text('Next', style: GoogleFonts.getFont('Lato',fontSize: 18)),
                            ),
                          ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageTwo() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.05),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: DropdownButtonFormField(
                  decoration: InputDecoration(
                              labelText: 'Country',labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey,),
                              prefixIcon: const Icon(Icons.hotel,color: Colors.blueGrey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                                borderRadius: BorderRadius.circular(20),
                              )),
                  dropdownColor: Color.fromARGB(255, 168, 222, 247),
                  value: selectedValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                  items: dropdownItems
                  ),
          ),
    
          SizedBox(height: MediaQuery.of(context).size.height*0.015),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                              labelText: 'City',labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey,),
                              prefixIcon: const Icon(Icons.location_city,color: Colors.blueGrey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                                borderRadius: BorderRadius.circular(20),
                              )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the city name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.015),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: TextFormField(
              controller: _districtController,
              decoration: InputDecoration(
                              labelText: 'District',labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey,),
                              prefixIcon: const Icon(Icons.location_city_rounded,color: Colors.blueGrey,),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueAccent,width: 3.0),
                                borderRadius: BorderRadius.circular(20),
                              )),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the district name';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.015),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                              labelText: 'Password',labelStyle: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey,),
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
                              )),
              obscureText: isObscured,
              
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            if (_currentPageIndex > 0)
              ElevatedButton(
                onPressed: _previousPage,
                style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              
                            ),
              child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Center(
                                child: Text('Previous', style: GoogleFonts.getFont('Lato',fontSize: 18)),
                              ),
                            ),
              ),
          ElevatedButton(
            onPressed: _registerManager,
            style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            
                          ),
            child: Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Center(
                              child: Text('Register', style: GoogleFonts.getFont('Lato',fontSize: 18)),
                            ),
                          ),
          ),]
          ),
          SizedBox(height: MediaQuery.of(context).size.height*0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("For existing account?",
                style: GoogleFonts.getFont('Josefin Sans',color: Colors.blueGrey,fontSize: 18)),
              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
              },
              child: Text(
                "Login Here",
                style: GoogleFonts.getFont('Josefin Sans',color: Colors.blueAccent,fontSize: 20),
              ))
            ],
          ),
        ],
      ),
    );
  }
  Future<void> _registerUser() async{
    String name = _nameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String hotelName = _hotelNameController.text;
    String country = selectedValue;
    String district = _districtController.text;
    String city = _cityController.text;
    try {
      if(name.isNotEmpty && _passwordController.text.isNotEmpty)
      {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: _passwordController.text,
      );
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Store registration form data in Firestore
    firestore.collection('managers').add({
      'name': name,
      'email': email,
      'phone': phone,
      'hotelName': hotelName,
      'country': country,
      'district': district,
      'city': city,
    });

    _showSuccessSnackbar('Registration successful! Welcome to the app.');
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
      }
    } catch (e) {
        _showErrorSnackbar('Registration failed. Please check your details.');
      
    }
  }
}