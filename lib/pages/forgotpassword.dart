import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_del/pages/signup.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mailcontroller = new TextEditingController();

  String email = "";

  final _formkey = GlobalKey<FormState>();

  resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        "Password Reset Email has been sent !",
        style: TextStyle(fontSize: 18.0),
      )));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "No user found for that email.",
          style: TextStyle(fontSize: 18.0),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.white,
                      Colors.blue.shade200,
                    ],
                  ),
                ),
        child: Column(
          children: [
            SizedBox(
              height: 70.0,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "Password Recovery",
                style: TextStyle(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter your mail",
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Form(
                  key: _formkey,
                    child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(179, 0, 0, 0), width: 2.0),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: mailcontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                        style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle:
                                TextStyle(fontSize: 18.0, color: const Color.fromARGB(255, 0, 0, 0)),
                            prefixIcon: Icon(
                              Icons.person,
                              color: const Color.fromARGB(179, 0, 0, 0),
                              size: 30.0,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  GestureDetector(
                    onTap: (){
                    if(_formkey.currentState!.validate()){
                      setState(() {
                        email= mailcontroller.text;
                      });
                      resetPassword();
                    }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 140,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "Send Email",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 18.0, color: const Color.fromARGB(255, 0, 0, 0)),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(
                              color: Color.fromARGB(224, 0, 156, 184),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ))),
          ],
        ),
      ),
    );
  }
}