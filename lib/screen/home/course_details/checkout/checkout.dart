


import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Column(
        children: [

        ],
      ),
    );
  }
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      title: const Text(
        "Checkout",
        
      ),
      elevation: 0.0,
      titleSpacing: 0,
    );
  }