import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/attendance_sheet.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
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
              onTap: () => {attendanceList(context)},
            ),
          ],
        ));
  }
}

attendanceList(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return AttendanceSheet();
      });
}
