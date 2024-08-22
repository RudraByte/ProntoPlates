// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_del/pages/bottomNav.dart';
import 'package:food_del/pages/login.dart';
import 'package:food_del/widgets/widgets.support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email = "", password = "", name = "";

  TextEditingController namecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    // ignore: unnecessary_null_comparison
    if (password != null && email != null && name != null) {
      try {
        // UserCredential userCredential = await FirebaseAuth.instance
            // .createUserWithEmailAndPassword(email: email, password: password);

        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            padding: EdgeInsets.symmetric(
                horizontal: 24.0, vertical: 8.0), // Adjust padding
            margin: EdgeInsets.symmetric(horizontal: 50.0), // Adjust margin
            behavior: SnackBarBehavior.floating,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            ))));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Registered Successfully",
            style: TextStyle(fontSize: 20.0),
          )));
        }
        else if(e.code=='email-already-in-use'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "Account already exists",
            style: TextStyle(fontSize: 20.0),
          )));
        }
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNav()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.blue.shade200,
                    ],
                  ),
                ),
              ),
              
              Container(
                margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.asset(
                        "images/logoo.png",
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: MediaQuery.of(context).size.width / 1.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // SizedBox(height: 0.0),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              SizedBox(height: 30.0),
                              Text(
                                "Sign up",
                                style: AppWidget.boldTextFieldStyle(),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: namecontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: AppWidget.SemiboldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.person_outlined),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: mailcontroller,
                                validator: (value) {
                                  
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter E-mail';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Email',
                                  hintStyle: AppWidget.SemiboldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                ),
                              ),
                              SizedBox(height: 30.0),
                              TextFormField(
                                controller: passwordcontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.SemiboldTextFieldStyle(),
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () async {
                                    if(_formkey.currentState!.validate()){
                                      setState(() {
                                        email=mailcontroller.text;
                                        name=namecontroller.text;
                                        password=passwordcontroller.text;
                                      });
                                    }
                                    registration();
                                    },
                                  
                                  
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SIGN UP",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins1',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                      child: Text(
                        "Already have an account? Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Poppins1',
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
      ),
    );
  }
}
