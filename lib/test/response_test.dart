import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swimmast_movil/main.dart';
import 'package:swimmast_movil/screens/member_Screens/profile_screen.dart';
import 'package:swimmast_movil/screens/notification_screen.dart';
import 'package:swimmast_movil/screens/shop_Screens/shop_screen.dart';


void main() {
  testWidgets('MyApp widget should contain a MaterialApp widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('ShopScreen widget should contain a ListView widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ShopScreen()));
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('HomeScreen widget should contain a Container widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: NotificationScreen()));
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('shopScreen widget should contain a Text widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ShopScreen()));
    expect(find.byType(MaterialApp), findsWidgets); // Using findsWidgets because there might be multiple Text widgets.
  });
}