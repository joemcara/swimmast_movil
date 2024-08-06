import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:swimmast_movil/screens/trainer_Screens/attendance_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/screens/trainer_Screens/work_out_screen.dart';

class PopoverButton extends StatelessWidget {
  final VoidCallback showModal;
  final int id;
  final MainScreenTraineeState state;
  const PopoverButton(
      {Key? key,
      required this.showModal,
      required this.id,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        Icons.more_vert,
        size: 20,
        color: Colors.blue,
      ),
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => ListItems(
            id: id,
            showAttendance: showModal,
            state: state, // Pass the callback
          ),
          direction: PopoverDirection.bottom,
          width: 150,
          arrowHeight: 0,
          height: 70,
          barrierDismissible: true,
        );
      },
    );
  }
}

class ListItems extends StatelessWidget {
  final VoidCallback showAttendance;
  final int id;
  final MainScreenTraineeState state;
  const ListItems(
      {Key? key,
      required this.showAttendance,
      required this.id,
      required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListView(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        children: [
          InkWell(
            onTap: () {
              print("tap");
              Navigator.of(context).pop();
              courseSelected = id;
              attendanceStateModal = true;
              showAttendance(); // Correctly call the callback
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero,
              ),
              height: 25,
              child: const Text(
                'Registrar Asistencia',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              print("op");
              state.changeSelected(2, 'Agregar Rutina');
            },
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.zero,
              ),
              height: 25,
              child: const Text(
                'Agregar Rutina',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
