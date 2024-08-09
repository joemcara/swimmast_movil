import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final int index;
  final Widget? nextPage;
  final int selectedIndex;
  final Function(int) onSelect;
  final List<Color> selectedGradient;
  final List<Color> defaultGradient;
  final Color selectIconTextColor;
  final Color defaultIconColor;
  final Color defaultIconTextColor;

  const GridItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.index,
    this.nextPage,
    required this.selectedIndex,
    required this.onSelect,
    required this.selectedGradient,
    required this.defaultGradient,
    required this.selectIconTextColor,
    required this.defaultIconColor,
    required this.defaultIconTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        onSelect(index);
        if (nextPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage!),
          );
        }
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(7.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected ? selectedGradient : defaultGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 207, 207, 207).withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 80,
                color: isSelected ? selectIconTextColor : defaultIconColor,
              ),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isSelected ? selectIconTextColor : defaultIconTextColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
