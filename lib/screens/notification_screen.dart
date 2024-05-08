import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [ProfileHeader(username: "Evelyn Smith")],
      ),
    );
  }
}
