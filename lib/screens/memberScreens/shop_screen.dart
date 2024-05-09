import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Container(
      margin: EdgeInsets.only(top: statusBarHeight),
      child: const Column(
        children: [],
      ),
    );
  }
}
