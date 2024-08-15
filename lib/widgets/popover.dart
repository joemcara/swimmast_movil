import 'package:popover/popover.dart';
import 'package:swimmast_movil/screens/trainer_Screens/bottomNav/main_screen_trainee.dart';
import 'package:swimmast_movil/screens/trainer_Screens/work_out_screen.dart';
import 'package:swimmast_movil/shared/constants.dart';

class PopoverButton extends StatelessWidget {
  final VoidCallback showModal;
  final int id;
  const PopoverButton({Key? key, required this.id, required this.showModal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(Icons.more_vert, size: 20, color: defaultGradient[0]),
      onTap: () {
        showPopover(
          context: context,
          bodyBuilder: (context) => ListItems(id: id, showAttendance: showModal
              // Pass the callback
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
  const ListItems({Key? key, required this.showAttendance, required this.id})
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
              Navigator.of(context).pop();
              courseSelected = id;
              attendanceStateModal = true;
              showAttendance();
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkoutScreen(),
                ),
              );
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
