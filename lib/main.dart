import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './models/courseSelected.dart';

import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/screens/sign_in_screen.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen_sport.dart';
import 'package:swimmast_movil/screens/member_Screens/home_screen_member.dart';
import 'package:swimmast_movil/screens/sport_Person/bottonNav/main_screen_sport.dart';
import 'package:swimmast_movil/screens/sign_up_screen.dart';
import 'package:swimmast_movil/screens/sign_in_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CourseSelected(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomeScreenSport(),
      //home: SignInScreen(),
      home : HomeScreenSport(),
    );
  }
}
