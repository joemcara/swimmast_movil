import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/member_Screens/profile_screen.dart';
import 'package:swimmast_movil/screens/sign_in_screen.dart';
import 'package:swimmast_movil/screens/edit_profile.dart';
import 'package:swimmast_movil/screens/shop_Screens/shop_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/competencies_screen_sport.dart';
import 'package:swimmast_movil/screens/member_Screens/packages_screen.dart';
import 'package:swimmast_movil/screens/member_Screens/home_screen.dart';
import 'package:swimmast_movil/screens/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(  


        appBarTheme: const AppBarTheme(
          surfaceTintColor: Color.fromARGB(255, 78, 67, 0),
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: const SignInScreen(),
      //home: const CompetenciesScreenSport(),
      home: HomePage(),
    );
  }
}
