import 'package:flutter/material.dart';

class SportBtBar extends StatefulWidget {
  final Function currentIndex;
  int selected = 0;
  SportBtBar({super.key, required this.currentIndex, required this.selected});

  @override
  State<SportBtBar> createState() => SportBtBarState();
}

class SportBtBarState extends State<SportBtBar> {
  int selectedIndex = 0;

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
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: const Color.fromRGBO(11, 34, 181, 1),
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
