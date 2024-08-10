import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';

class ClassScheduleSport extends StatefulWidget {
  const ClassScheduleSport({super.key});

  @override
  State<ClassScheduleSport> createState() => _ClassScheduleSportState();
}

class _ClassScheduleSportState extends State<ClassScheduleSport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Horarios de clases",
        back: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
