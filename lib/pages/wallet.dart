import 'dart:async';
// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_del/widgets/widgets.support.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:fooddeliveryapp/service/database.dart';
// import 'package:fooddeliveryapp/service/shared_pref.dart';
// import 'package:fooddeliveryapp/widget/app_constant.dart';
// import 'package:fooddeliveryapp/widget/widget_support.dart';
// import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  // getthesharedpref() async {
  //   wallet = await SharedPreferenceHelper().getUserWallet();
  //   id = await SharedPreferenceHelper().getUserId();
  //   setState(() {});
  // }

  // ontheload() async {
  //   await getthesharedpref();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   ontheload();
  //   super.initState();
  // }

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue.shade100,
        body: Container(decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Colors.blue.shade100,
            ],
          ),),
            
            // margin: const EdgeInsets.only(top: 40.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

              Material(
                  elevation: 2.0,
                  child: Container(decoration: BoxDecoration(color: Colors.blue.shade100),
                      padding: const EdgeInsets.only(bottom: 10.0,top: 40),
                      child: Center(
                          child: Text(
                        "Money",
                        style: AppWidget.MaxTextFieldStyle(),
                      )))),
              const SizedBox(
                height: 30.0,
              ),
              Container(margin: EdgeInsets.all(8),
                
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                      color: Colors.blue.shade200),
                  child: Row(children: [
                    const SizedBox(
                      width: 20.0,
                    ),
                    Image.asset(
                      "images/wallet2.png",
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 30.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Your Money",
                          style: AppWidget.boldTextFieldStyle(),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          "\$" "150",
                          style: AppWidget.MaxTextFieldStyle(),
                        ),
                      ],
                    )
                  ])),
              const SizedBox(
                height: 15,
              ),
              Container(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/2.9),
                  child: Text(
                    'Add Money',
                    style: AppWidget.boldTextFieldStyle(),
                  )),
                  const SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                GestureDetector(
                    onTap: () {
                      // makePayment('100');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" "20",
                        style: AppWidget.SemiboldTextFieldStyle(),
                      ),
                    )),
                    GestureDetector(
                    onTap: () {
                      // makePayment('100');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" "50",
                        style: AppWidget.SemiboldTextFieldStyle(),
                      ),
                    )),
                    GestureDetector(
                    onTap: () {
                      // makePayment('100');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" "100",
                        style: AppWidget.SemiboldTextFieldStyle(),
                      ),
                    )),
                    GestureDetector(
                    onTap: () {
                      // makePayment('100');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "\$" "200",
                        style: AppWidget.SemiboldTextFieldStyle(),
                      ),
                    ))
              ]),const SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      openEdit();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text(
                          "Add Money",
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  // Future<void> makePayment(String amount) async {
  //   try {
  //     paymentIntent = await createPaymentIntent(amount, 'INR');
  //     //Payment Sheet
  //     await Stripe.instance
  //         .initPaymentSheet(
  //             paymentSheetParameters: SetupPaymentSheetParameters(
  //                 paymentIntentClientSecret: paymentIntent!['client_secret'],
  //                 // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
  //                 // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
  //                 style: ThemeMode.dark,
  //                 merchantDisplayName: 'Adnan'))
  //         .then((value) {});

  //     ///now finally display payment sheeet
  //     displayPaymentSheet(amount);
  //   } catch (e, s) {
  //     print('exception:$e$s');
  //   }
  // }

  // displayPaymentSheet(String amount) async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet().then((value) async {
  //       add = int.parse(wallet!) + int.parse(amount);
  //       await SharedPreferenceHelper().saveUserWallet(add.toString());
  //       await DatabaseMethods().UpdateUserwallet(id!, add.toString());
  //       // ignore: use_build_context_synchronously
  //       showDialog(
  //           context: context,
  //           builder: (_) => const AlertDialog(
  //                 content: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.check_circle,
  //                           color: Colors.green,
  //                         ),
  //                         Text("Payment Successfull"),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ));
  //       await getthesharedpref();
  //       // ignore: use_build_context_synchronously

  //       paymentIntent = null;
  //     }).onError((error, stackTrace) {
  //       print('Error is:--->$error $stackTrace');
  //     });
  //   } on StripeException catch (e) {
  //     print('Error is:---> $e');
  //     showDialog(
  //         context: context,
  //         builder: (_) => const AlertDialog(
  //               content: Text("Cancelled "),
  //             ));
  //   } catch (e) {
  //     print('$e');
  //   }
  // }

  // //  Future<Map<String, dynamic>>
  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };

  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       headers: {
  //         'Authorization': 'Bearer $secretKey',
  //         'Content-Type': 'application/x-www-form-urlencoded'
  //       },
  //       body: body,
  //     );
  //     // ignore: avoid_print
  //     print('Payment Intent Body->>> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     // ignore: avoid_print
  //     print('err charging user: ${err.toString()}');
  //   }
  // }

  // calculateAmount(String amount) {
  //   final calculatedAmout = (int.parse(amount)) * 100;

  //   return calculatedAmout.toString();
  // }

  Future openEdit() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.cancel)),
                        const SizedBox(
                          width: 60.0,
                        ),
                        const Center(
                          child: Text(
                            "Add Money",
                            style: TextStyle(
                              color: Color(0xFF008080),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text("Amount"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 2.0),
                          borderRadius: BorderRadius.circular(10)),
                      child: const TextField(
                        // controller: amountcontroller,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Enter Amount'),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                          // makePayment(amountcontroller.text);
                        },
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFF008080),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                              child: Text(
                            "Pay",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
            