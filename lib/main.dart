import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';
import './models/courseSelected.dart';

import 'package:swimmast_movil/screens/sport_Person/home_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/signsport.dart';
import 'package:swimmast_movil/screens/sport_Person/profile_screen_sport.dart';

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
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      //home: const SignInScreen(),
      //home: HomeScreenSport(),

      home: SignSportScreen(),
      //home: ProfileScreenSport(),
    );
  }
}
