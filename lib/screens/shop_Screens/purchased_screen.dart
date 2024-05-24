import 'package:flutter/material.dart';

class PurchasedScreen extends StatefulWidget {
  const PurchasedScreen({super.key});

  @override
  State<PurchasedScreen> createState() => PpurchaseScreendState();
}

class PpurchaseScreendState extends State<PurchasedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Purchased Screen"),
    );
  }
}