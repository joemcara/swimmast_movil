import 'package:swimmast_movil/shared/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  final bool? back;
  
  CustomAppBar({
    required this.title,
    this.bottom, 
    this.back,
    
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: back ?? false,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      title: Text(
        '\t\t '+title,
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
