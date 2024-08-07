import 'package:swimmast_movil/shared/bottom_navs.dart/bottom_nav_bar.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/widgets/router_bottom_nav.dart';

class MainScreenTrainee extends StatefulWidget {
  const MainScreenTrainee({super.key});

  @override
  State<MainScreenTrainee> createState() => MainScreenTraineeState();
}

class MainScreenTraineeState extends State<MainScreenTrainee> {
  final GlobalKey<SportBtBarState> childKey = GlobalKey<SportBtBarState>();

  int index = 0;
  bool flag = true;
  SportBtBar? trainerBtBar;
  @override
  void initState() {
    super.initState();
    trainerBtBar = SportBtBar(
      currentIndex: (index) {
        setState(() {
          this.index = index;
        });
      },
      selected: index,
    );
  }

  void changeSelected(int id) {
    setState(() {
      index = 1;
      courseSelected = id;
      print("yei");
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: trainerBtBar,
        body: BottomRouteTrainee(
          key: childKey,
          index: index,
        ));
  }
}
