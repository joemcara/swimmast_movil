import 'package:swimmast_movil/shared/constants.dart';

class SportBtBar extends StatefulWidget {
  final Function currentIndex;
  int selected = 0;
  SportBtBar({super.key, required this.currentIndex, required this.selected});

  @override
  State<SportBtBar> createState() => SportBtBarState();
}

class SportBtBarState extends State<SportBtBar> {
  int selectedIndex = 0;

  int widgetCurrent() {
    if (widget.selected == 3) {
      return 0;
    } else if (widget.selected == 5) {
      return 0;
    } else if (widget.selected == 4) {
      return 0;
    } else {
      return widget.selected;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widgetCurrent(),
      onTap: (index) {
        setState(() {
          widget.selected = index;
          widget.currentIndex(index);
        });
      },

      // stles
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: defaultGradient[0],
      unselectedItemColor: Colors.black,
      enableFeedback: false,
      iconSize: 33,
      // end styles
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'group',
        )
      ],
    );
  }
}

class MemberBtBar extends StatefulWidget {
  final Function currentIndex;
  int selected = 0;
  MemberBtBar({super.key, required this.currentIndex, required this.selected});

  @override
  State<MemberBtBar> createState() => _MemberBtBarState();
}

class _MemberBtBarState extends State<MemberBtBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selected,
      onTap: (index) {
        setState(() {
          // selectedIndex = index;
          widget.selected = index;
          widget.currentIndex(index);
        });
      },

      // stles
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color.fromRGBO(11, 34, 181, 1),
      unselectedItemColor: Colors.black,
      iconSize: 33,
      // end styles

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.grey),
          activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.grey),
          activeIcon:
              Icon(Icons.notifications, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'Notificaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          activeIcon: Icon(Icons.person, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'Perfil',
        ),
      ],
    );
  }
}

class SportPerBtBar extends StatefulWidget {
  final Function currentIndex;
  int selected = 0;
  SportPerBtBar(
      {super.key, required this.currentIndex, required this.selected});

  @override
  State<SportPerBtBar> createState() => _SportPerBtBarState();
}

class _SportPerBtBarState extends State<SportPerBtBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selected,
      onTap: (index) {
        setState(() {
          widget.selected = index;
          widget.currentIndex(index);
        });
      },

      // stles
      type: BottomNavigationBarType.fixed,
      enableFeedback: false,
      selectedItemColor: Color.fromARGB(255, 10, 5, 59),
      unselectedItemColor: Colors.black,
      iconSize: 33,
      // end styles

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.grey),
          activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.grey),
          activeIcon:
              Icon(Icons.notifications, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'Notificaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          activeIcon: Icon(Icons.person, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'Perfil',
        ),
      ],
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int selected;
  final ValueChanged<int> currentIndex;

  CustomBottomNavigationBar(
      {required this.selected, required this.currentIndex});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selected,
      onTap: (index) {
        setState(() {
          widget.currentIndex(index);
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Colors.grey),
          activeIcon: Icon(Icons.home, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications, color: Colors.grey),
          activeIcon:
              Icon(Icons.notifications, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'Notificaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.grey),
          activeIcon: Icon(Icons.person, color: Color.fromARGB(255, 10, 5, 59)),
          label: 'Perfil',
        ),
      ],
      selectedItemColor: Color.fromARGB(255, 10, 5, 59),
    );
  }
}
