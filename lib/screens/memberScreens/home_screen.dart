import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class HomeScreenMember extends StatelessWidget {
  const HomeScreenMember({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [ProfileHeader(username: "Evelyn Smith")],
      ),
    );
  }
}
