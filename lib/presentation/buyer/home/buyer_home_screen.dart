import 'package:flutter/material.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}


class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
   int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Buyer Home',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              // Handle logout
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                'Welcome to Buyer Home Screen!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}