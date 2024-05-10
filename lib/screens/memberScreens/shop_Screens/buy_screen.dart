import 'package:flutter/material.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Comprar'),
      ),
      body: const Center(
        child: Text('Comprar'),
      ),
    );
  }
}