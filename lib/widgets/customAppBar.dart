import 'package:flutter/material.dart';

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
      leading: onBackPressed != null ? IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: onBackPressed,
      ) : null, 
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2F4458),
              Color(0xFF1E2A34),
            ],
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
