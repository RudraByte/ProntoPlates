import 'package:flutter/material.dart';
import 'package:food_del/pages/details.dart';

import 'package:food_del/widgets/widgets.support.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool icecream = false, pizza = false, salad = false, burger = false;
  
  final List<Map<String, String>> allItems = [
    {'category': 'ice-cream', 'name': 'Vanilla Ice Cream', 'price': '\$5', 'image': 'images/vanilla.png','detail':'Vanilla ice cream has a smooth, creamy texture and a rich, sweet flavor with the distinct, aromatic taste of vanilla.'},
    {'category': 'ice-cream', 'name': 'Chocolate Ice Cream', 'price': '\$5', 'image': 'images/choco.png','detail':'Indulge in the rich, creamy taste of our decadent chocolate ice cream, crafted with premium cocoa to deliver a velvety smooth texture and an intense chocolate flavor. '},
    {'category': 'pizza', 'name': 'Margherita Pizza', 'price': '\$20', 'image': 'images/margrita-pizza.jpg','detail':'veruy good ice cream'},
    {'category': 'pizza', 'name': 'Chicken Pizza', 'price': '\$30', 'image': 'images/chick-pizza.jpg','detail':'A classic Italian pizza with a crispy, thin crust, topped with a simple and flavorful combination of fresh tomato sauce, melted mozzarella cheese, and fragrant basil leaves. '},
    {'category': 'burger', 'name': 'Cheese burger', 'price': '\$15', 'image': 'images/cheese.jpeg','detail':"A classic delight, the Cheese Burger features a juicy patty grilled to perfection, topped with a slice of melted cheddar cheese. Nestled in a soft, toasted bun, it's complemented by fresh lettuce, ripe tomato, pickles, and a smear of tangy ketchup and creamy mayo. "},
    {'category': 'salad', 'name': 'Caesar Salad', 'price': '\$10', 'image': 'images/salad2.png','detail':'veruy good ice cream'},
    {'category': 'ice-cream', 'name': 'Strawberry Ice Cream', 'price': '\$5', 'image': 'images/st.png','detail':'Crisp romaine lettuce tossed with crunchy croutons and freshly grated Parmesan cheese, all coated in a creamy Caesar dressing. A classic favorite with a perfect balance of savory flavors and a touch of tanginess.'},
    {'category': 'ice-cream', 'name': 'Black Current Ice Cream', 'price': '\$5', 'image': 'images/bc.png','detail':'Indulge in the rich, tangy flavor of our Black Currant Ice Cream. Crafted with premium black currants, this delightful treat offers a perfect balance of sweet and tart notes.'},
    {'category': 'pizza', 'name': 'Veg Pizza', 'price': '\$22', 'image': 'images/vegppp.png','detail':'Indulge in our flavorful Vegetable Pizza, featuring a crisp, golden crust topped with a rich tomato sauce and a generous blend of fresh, seasonal vegetables. '},
    {'category': 'pizza', 'name': 'Mushroom Pizza', 'price': '\$25', 'image': 'images/mushp.png','detail':'Delight in the rich, savory flavors of our Mushroom Pizza, featuring a crisp, golden crust topped with a luscious layer of tomato sauce and a generous helping of melted mozzarella cheese.  '},
    {'category': 'burger', 'name': 'Veg burger', 'price': '\$18', 'image': 'images/vegb.png','detail':'Savor the delight of our Veg Burger, crafted with a flavorful, seasoned vegetable patty made from fresh, crisp veggies. '},
    {'category': 'salad', 'name': 'Corn Salad', 'price': '\$10', 'image': 'images/cornsal.png','detail':'A vibrant and refreshing blend of sweet corn, crisp vegetables, and zesty dressing. This delightful salad features tender corn kernels mixed with colorful bell peppers, cherry tomatoes, and red onions, all tossed in a tangy lime vinaigrette'},
    {'category': 'ice-cream', 'name': 'Mango Ice Cream', 'price': '\$5', 'image': 'images/man.png','detail':'Indulge in the tropical delight of our Mango Ice Cream, crafted with the juiciest, sun-ripened mangoes. This creamy treat delivers a refreshing burst of fruity sweetness with each spoonful.'},
    
    {'category': 'pizza', 'name': 'Tandoori Paneer Pizza', 'price': '\$28', 'image': 'images/panp.png','detail':'Indulge in the perfect blend of traditional and contemporary flavors with our Tandoori Paneer Pizza. This delightful pizza features a crispy, golden-brown crust topped with a rich, tangy tomato sauce and a generous layer of melted cheese. '},
    {'category': 'burger', 'name': 'Paneer burger', 'price': '\$20', 'image': 'images/panb.png','detail':'Enjoy a delicious twist on the classic burger with our Paneer Burger. Featuring a juicy, grilled paneer patty seasoned with a blend of aromatic spices, this burger is topped with fresh lettuce, juicy tomatoes, and crisp onions.'},
    {'category': 'burger', 'name': 'Chicken burger', 'price': '\$25', 'image': 'images/chickb.png','detail':'Juicy, tender chicken breast, seasoned to perfection and grilled to a delightful crisp. Nestled in a freshly toasted bun, topped with crisp lettuce, ripe tomatoes, and a zesty mayo sauce. '},

    {'category': 'salad', 'name': 'Pasta Salad', 'price': '\$15', 'image': 'images/pastasal.png','detail':'A delightful blend of perfectly cooked pasta mixed with crisp, fresh vegetables and tossed in a zesty dressing. '},
    {'category': 'salad', 'name': 'Tomato Salad', 'price': '\$12', 'image': 'images/tomatosal.png','detail':'A refreshing and vibrant salad featuring ripe, juicy tomatoes. This dish combines the natural sweetness and tanginess of fresh tomatoes with a hint of aromatic basil and a drizzle of olive oil. Lightly seasoned with salt and pepper.'},

  ];

  List<Map<String, dynamic>> displayedItems = [];

  @override
  void initState() {
    super.initState();
    displayedItems = allItems; 
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        "Hello Ansh,",
                        style: AppWidget
                            .MaxTextFieldStyle(), 
                      ),
                    ),
                    
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "Let's Eat Healthy & Tasty!",
                  style: AppWidget.TextFieldStyle(), 
                ),
                Text(
                  "Order delicious food online and enjoy the taste.",
                  style: AppWidget
                      .LightTextFieldStyle(),
                ),
                const SizedBox(height: 20),
                showItem(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Divider(color: Colors.blue.shade200,),
                ),
                Center(child: Text('Exclusive Offers',style: AppWidget.boldTextFieldStyle(),)),
                const SizedBox(height: 10),
                



                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        buildFoodItem(
                            'images/bogo.png', '  Buy One Get One', '   Valid till 31st September'),
                        const SizedBox(width: 20),
                        buildFoodItem(
                            'images/fd.gif', '  Free Delivery', '  On orders above \$100'),
                        const SizedBox(width: 20),
                        buildFoodItem(
                            'images/card1.png', '  Bank Offers', '  On selected banks'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Divider(color: Colors.blue.shade200,),
                ),
                Center(child: Text('Selected Menu',style: AppWidget.boldTextFieldStyle(),)),
                const SizedBox(height: 10),
                buildSelectedItems(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFoodItem(String src, String name, String price) {
    return GestureDetector(
      
      
      child: Material(
        color: Colors.blue.shade100,
        // elevation: 5,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 255, 255),
              Colors.blue.shade100,
            ],
          ),
          // Background color for images
              ),
              padding: const EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Image.asset(src,
                  
                  height: 150,
                  width: 150,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(name, style: AppWidget.SemiboldTextFieldStyle()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(price, style: AppWidget.LightTextFieldStyle()),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedItems() {
    return Column(
      children: displayedItems.map((item) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: buildFoodRow(item['image']!, item['name']!, item['price']!, item['detail']!),
        );
      }).toList(),
    );
  }

  Widget buildFoodRow(String imagePath, String name, String price, String detail) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Details(
              detail:
                  detail,
              name: name,
              imagePath: imagePath,
              price: price,
            ),
          ),
        );
      },
        child: Material(
          color: Colors.blue.shade100,
          elevation: 5,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  child: Image.asset(imagePath),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: AppWidget.SemiboldTextFieldStyle()),
                    Text('Tap to know more',
                        style: AppWidget.LightTextFieldStyle()),
                  ],
                ),
                const Spacer(),
                Text(price, style: AppWidget.MaxTextFieldStyle()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCategoryItem('images/ice-cream.png', icecream),
            buildCategoryItem('images/burger.png', burger),
            buildCategoryItem('images/pizza.png', pizza),
            buildCategoryItem('images/salad.png', salad),
          ],
        ));
  }

  Widget buildCategoryItem(String imagePath, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          icecream = false;
          burger = false;
          pizza = false;
          salad = false;
          if (imagePath.contains('ice-cream')) {
            icecream = true;
            displayedItems = allItems.where((item) => item['category'] == 'ice-cream').toList();
          } else if (imagePath.contains('burger')) {
            burger = true;
            displayedItems = allItems.where((item) => item['category'] == 'burger').toList();
          } else if (imagePath.contains('pizza')) {
            pizza = true;
            displayedItems = allItems.where((item) => item['category'] == 'pizza').toList();
          } else if (imagePath.contains('salad')) {
            salad = true;
            displayedItems = allItems.where((item) => item['category'] == 'salad').toList();
          }

        });
      },
      child: Material(
        color: const Color.fromARGB(255, 172, 218, 255),
        elevation: 5,
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  isSelected ? Colors.white : Colors.white,
                  isSelected ? Colors.blue.shade100 : Colors.blue.shade100,
                ],
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              imagePath,
              height: isSelected ? 60 : 40,
              width: isSelected ? 60 : 40,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

}