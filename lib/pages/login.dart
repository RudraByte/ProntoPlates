// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_del/pages/bottomNav.dart';
import 'package:food_del/pages/forgotpassword.dart';
import 'package:food_del/pages/signup.dart';
// import 'package:food_del/widgets/content_model.dart';
import 'package:food_del/widgets/widgets.support.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "", password = "";
    final _formkey= GlobalKey<FormState>();
    TextEditingController useremailcontroller= new TextEditingController();
    TextEditingController userpasswordcontroller= new TextEditingController();

    
    userlogin() async {
      try{
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      }on FirebaseAuthException catch(e){
        if( e.code=='user-not-foud'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No User found', style: TextStyle(fontSize: 18,color:Colors.black),)));
        }
        else if(e.code=='wrong password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter correct password', style: TextStyle(fontSize: 18,color:Colors.black),)));
          
        }
      }
    
    // ignore: unnecessary_null_comparison
    if (password != null && email!= null ) {
      ScaffoldMessenger.of(context).showSnackBar((SnackBar(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          padding: EdgeInsets.symmetric(
              horizontal: 24.0, vertical: 8.0), // Adjust padding
          margin: EdgeInsets.symmetric(horizontal: 50.0), // Adjust margin
          behavior: SnackBarBehavior.floating,
          content: Text(
            "Login Successful!",
            style: TextStyle(fontSize: 20.0),
          ))));
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNav()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue.shade100,
    
    
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                   color:Colors.black
                  ),
                
                child: Center(
                  child: Image.asset(
                    "images/logoo.png",
                    color: Colors.blue.shade100,
                    width: MediaQuery.of(context).size.width / 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.0),
                          Center(
                            child: Text(
                              "Login",
                              style: AppWidget.boldTextFieldStyle(),
                            ),
                          ),
                          SizedBox(height: 30.0),
                          TextFormField(
                            controller: useremailcontroller,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
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
                             controller:userpasswordcontroller,
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
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: AppWidget.LightTextFieldStyle(),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                setState(() {
                                  email = useremailcontroller.text;
                                  password = userpasswordcontroller.text;
                                });
                              }
                              userlogin();
                            },
                            
                            child: Center(
                              child: Material(
                                elevation: 5.0,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontFamily: 'Poppins1',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Center(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()));
                              },
                              child: Text(
                                "Don't have an account? Sign up",
                                style: AppWidget.SemiboldTextFieldStyle(),
                              ),
                            ),
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
      ),
    );
  }
}
