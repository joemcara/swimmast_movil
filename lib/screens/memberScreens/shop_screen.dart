import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [ProfileHeader(username: "Evelyn Smith")],
      ),
    );
  }
}
