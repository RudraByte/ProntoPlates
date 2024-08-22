import 'package:flutter/material.dart';
import 'package:food_del/pages/bottomNav.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => OrderState();
}


class OrderState extends State<Order> {

  // Sample data for cart items
   static List<Map<String, dynamic>> cartItems = [
    {'name': 'Margherita Pizza', 'price': 20.0, 'quantity': 1, 'image': 'images/margrita-pizza.jpg'},
    {'name': 'Caesar Salad', 'price': 10.0, 'quantity': 2, 'image': 'images/salad2.png'},
    {'name': 'Vanilla Ice Cream', 'price': 5.0, 'quantity': 3, 'image': 'images/vanilla.png'},
  ];

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  void _increaseQuantity(int index) {
    setState(() {
      cartItems[index]['quantity'] += 1;
    });
  }

  void _decreaseQuantity(int index) {
    setState(() {
      if (cartItems[index]['quantity'] > 1) {
        cartItems[index]['quantity'] -= 1;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
        title: const Text('My Cart', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
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
        child: cartItems.isEmpty
            ? Center(child: Text('Your cart is empty', style: TextStyle(fontSize: 18, color: Colors.black54)))
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: ListTile(tileColor: Colors.blue.shade200,
                            
                              leading: Image.asset(item['image'], width: 50, height: 50, fit: BoxFit.cover),
                              title: Text(item['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('\$${item['price']} x ${item['quantity']}'),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove_circle_outline, color: const Color.fromARGB(255, 0, 0, 0)),
                                    onPressed: () => _decreaseQuantity(index),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add_circle_outline, color: const Color.fromARGB(255, 0, 0, 0)),
                                    onPressed: () => _increaseQuantity(index),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: const Color.fromARGB(255, 0, 0, 0)),
                                    onPressed: () => _removeItem(index),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Total Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text('\$${totalPrice.toStringAsFixed(2)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Checkout and Continue Shopping Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to checkout page
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                            backgroundColor: Colors.blue.shade300,
                          ),
                          child: const Text('Checkout', style: TextStyle(fontSize: 16,color: Colors.black)),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            // Navigate back to home page or menu
                            Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BottomNav()));
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            side: BorderSide(color: Colors.blue.shade300),
                          ),
                          child: const Text('Continue Shopping', style: TextStyle(fontSize: 16, color: Colors.black)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
