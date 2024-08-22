import 'package:flutter/material.dart';
import 'package:food_del/pages/order.dart';
import 'package:food_del/widgets/widgets.support.dart';

class Details extends StatefulWidget {
  final String imagePath, name, detail, price;

  Details({
    required this.detail,
    required this.imagePath,
    required this.name,
    required this.price,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int quantity = 1;
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    // Remove the dollar sign before parsing the price
    totalPrice = int.parse(widget.price.replaceAll("\$", ""));
  }

  void addToCart() {
    setState(() {
      OrderState.cartItems.add({
        'image': widget.imagePath,
        'name': widget.name,
        'quantity': quantity,
        'price': totalPrice,
      });
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(
          "Food Added to Cart",
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Colors.blue.shade100,
            ],
          ),
        ),
        padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            Image.asset(
              widget.imagePath,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.25,
              fit: BoxFit.fitHeight,
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: AppWidget.SemiboldTextFieldStyle(),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      quantity--;
                      totalPrice = totalPrice - int.parse(widget.price.replaceAll("\$", ""));
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Text(
                  quantity.toString(),
                  style: AppWidget.LightTextFieldStyle(),
                ),
                const SizedBox(width: 20.0),
                GestureDetector(
                  onTap: () {
                    quantity++;
                    totalPrice = totalPrice + int.parse(widget.price.replaceAll("\$", ""));
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Text(
              widget.detail,
              maxLines: 4,
              style: AppWidget.LightTextFieldStyle(),
            ),
            const SizedBox(height: 30.0),
            Row(
              children: [
                Text(
                  "Delivery Time",
                  style: AppWidget.LightTextFieldStyle(),
                ),
                const SizedBox(width: 25.0),
                const Icon(
                  Icons.alarm,
                  color: Colors.black54,
                ),
                const SizedBox(width: 5.0),
                Text(
                  "30 min",
                  style: AppWidget.SemiboldTextFieldStyle(),
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: AppWidget.SemiboldTextFieldStyle(),
                      ),
                      Text(
                        "\$$totalPrice",
                        style: AppWidget.boldTextFieldStyle(),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: addToCart,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "Add to cart",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(width: 30.0),
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
