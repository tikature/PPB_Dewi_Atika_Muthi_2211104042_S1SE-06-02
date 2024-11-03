import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        backgroundColor: Colors.pink[100],
      ),
      body: Center(
        child: Text('Cart is empty'),
      ),
    );
  }
}
