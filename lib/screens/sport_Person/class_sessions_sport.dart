import 'package:flutter/material.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/widgets/widget_performed.dart';
import 'package:swimmast_movil/widgets/routine_info_cards.dart';


class ClassSessionsSport extends StatefulWidget {
  const ClassSessionsSport({super.key});

  @override
  State<ClassSessionsSport> createState() =>
      _ClassSessionsSportState();
}

class _ClassSessionsSportState extends State<ClassSessionsSport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Sessiones de clases",
        back: true, 
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          WidgetPerformed(),
          SizedBox(height: 30),
          RoutineInfoCards()
        ],
      ),
    );
  }
}
