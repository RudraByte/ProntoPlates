import 'package:flutter/material.dart';
import 'package:food_del/pages/bottomNav.dart';
import 'package:food_del/pages/signup.dart';
// import 'package:food_del/pages/wallet.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
        title: const Text('Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                // Profile Picture
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(
                      'images/boy.jpg'), 
                ),
                const SizedBox(height: 20),
                Text(
                  'Ansh Pandey',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'anshrudrapandey@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 87, 87, 87),
                  ),
                ),
                const SizedBox(height: 30),
                // Profile Menu
                ProfileMenuItem(
                  icon: Icons.person,
                  title: 'Account Settings',
                  onTap: () {
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.history,
                  title: 'Order History',
                  onTap: () {
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.wallet_giftcard,
                  title: 'Wallet',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BottomNav()));
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.location_on,
                  title: 'Delivery Addresses',
                  onTap: () {
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue.shade300),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
