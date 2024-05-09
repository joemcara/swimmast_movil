import 'package:flutter/material.dart';

class TrainerBtBar extends StatefulWidget {
  final Function currentIndex;
  const TrainerBtBar({super.key, required this.currentIndex});

  @override
  State<TrainerBtBar> createState() => _TrainerBtBarState();
}

class _TrainerBtBarState extends State<TrainerBtBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
          widget.currentIndex(index);
        });
      },

      // stles
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color.fromRGBO(11, 34, 181, 1),
      unselectedItemColor: Colors.black,
      iconSize: 33,
      // end styles
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'book',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'event',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'group',
        )
      ],
    );
  }
}

class MemberBtBar extends StatefulWidget {
  final Function currentIndex;
  const MemberBtBar({super.key, required this.currentIndex});

  @override
  State<MemberBtBar> createState() => _MemberBtBarState();
}

class _MemberBtBarState extends State<MemberBtBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) {
        setState(() {
          selectedIndex = index;
          widget.currentIndex(index);
        });
      },

      // stles
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color.fromRGBO(11, 34, 181, 1),
      unselectedItemColor: Colors.black,
      iconSize: 33,
      // end styles

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'event',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'book',
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
