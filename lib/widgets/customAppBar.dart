import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final PreferredSizeWidget? bottom;

  CustomAppBar({
    required this.title,
    required this.onBackPressed,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: onBackPressed != null
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: defaultIconColor),
              onPressed: onBackPressed,
            )
          : null,
      title: Text(
        title,
        style: const TextStyle(
          color: defaultIconTextColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: defaultGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? Size.fromHeight(kToolbarHeight)
      : Size.fromHeight(kToolbarHeight + bottom!.preferredSize.height);
}