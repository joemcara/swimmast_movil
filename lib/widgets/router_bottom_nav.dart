import 'package:swimmast_movil/screens/member_Screens/home_screen_member.dart';
import 'package:swimmast_movil/screens/member_Screens/profile_screen.dart';
import 'package:swimmast_movil/screens/notification_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen_sport.dart';
import 'package:swimmast_movil/screens/trainer_Screens/home_screen.dart';
import 'package:swimmast_movil/screens/trainer_Screens/profile_screen.dart';

import 'package:swimmast_movil/shared/constants.dart';


class BottomRouteTrainee extends StatelessWidget {
  final int index;
  const BottomRouteTrainee({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = const [
      HomeScreen(),
      NotificationScreen(),
      ProfileScreenTrainer()
    ];
    return screens[index];
  }
}

class BottomRouteMember extends StatelessWidget {
  final int index;
  const BottomRouteMember({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreenMember(
        idUser: idUser,
        token: token,
      ),
      NotificationScreen(),
      ProfileScreen(),
    ];
    return screens[index];
  }
}

class BottomRouteSportPerson extends StatelessWidget {
  final int index;
  const BottomRouteSportPerson({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeScreenSport(),
      NotificationScreen(),
      ProfileScreenSport(),
    ];
    return screens[index];
  }
}
