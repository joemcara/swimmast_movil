import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/attendance_sheet.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  AttendanceScreenState createState() => AttendanceScreenState();
}

class AttendanceScreenState extends State<AttendanceScreen> {
  void stateLinkHome() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showModal(context);
    });
  }

  @override
  void initState() {
    if (attendanceStateModal == true) {
      stateLinkHome();
    }
  }

  void _showModal(BuildContext contextParent) {
    attendanceStateModal = false;
    showModalBottomSheet(
        context: contextParent,
        isScrollControlled: true,
        builder: (context) {
          return AttendanceSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Grupos de clases",
              style: styleTitles,
            ),
            SizedBox(height: 10),
            GestureDetector(
                child: Container(
                  margin: EdgeInsets.all(20),
                  width: 350,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(color: borderColor),
                      color: Colors.white),
                ),
                onTap: () => {_showModal(context)}),
          ],
        ));
  }
}
