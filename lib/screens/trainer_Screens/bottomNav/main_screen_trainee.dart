import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importar para inicializar la localización
import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/profile_header_trainee.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';

class MainScreenTrainee extends StatefulWidget {
  const MainScreenTrainee({super.key});

  @override
  State<MainScreenTrainee> createState() => MainScreenTraineeState();
}

class MainScreenTraineeState extends State<MainScreenTrainee> {
  final GlobalKey<SportBtBarState> childKey = GlobalKey<SportBtBarState>();

  int index = 0;
  String title = "Hola";
  String _dateFormated = "";
  String day = "";
  bool flag = true;
  SportBtBar? trainerBtBar;

  @override
  void initState() {
    super.initState();
    dateToday();
    trainerBtBar = SportBtBar(
      currentIndex: (index) {
        setState(() {
          this.index = index;
        });
      },
      selected: index,
    );
  }

  void changeSelected(int id, String nameOption) {
    setState(() {
      if (nameOption == 'Cursos') {
        index = 1;
      } else if (nameOption == 'Manejar Miembros') {
        index = 4;
      } else {
        index = 2;
      }
      courseSelected = id;
      trainerBtBar = SportBtBar(
        currentIndex: (index) {
          setState(() {
            this.index = index;
          });
        },
        selected: index,
      );
    });
  }

  Future<void> dateToday() async {
    await initializeDateFormatting('es_ES', null);
    final format = DateFormat('EEEE, d \'de\' MMMM \'del\' yyyy', 'es_ES');
    var date = format.format(DateTime.now());
    final dateUppercase = date[0].toUpperCase() + date.substring(1);
    day = dateUppercase.split(",")[0];
    setState(() {
      _dateFormated = dateUppercase;
      today = _dateFormated;
      dayNow = day;
    });
  }

  void changeHeaderTitle(String title) {
    setState(() {
      title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: trainerBtBar,
        appBar: index != 4
            ? AppBar(
                actions: [
                  ProfileHeaderTrainee(
                    username: userName,
                    message: "Hola, $userName",
                    onAvatarTap: () {
                      setState(() {
                        index = 4;
                        trainerBtBar = SportBtBar(
                          currentIndex: (index) {
                            setState(() {
                              this.index = index;
                            });
                          },
                          selected: index,
                        );
                      });
                    },
                  )
                ],
                toolbarHeight: 120,
                automaticallyImplyLeading: false,
              )
            : null,
        body: BottomRouteTrainee(
          key: childKey,
          index: index,
        ));
  }
}
