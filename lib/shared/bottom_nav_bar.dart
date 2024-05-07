import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:swimmast_movil/screens/home_screen.dart';
import 'package:swimmast_movil/screens/notification_screen.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 70,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (value) => controller.selectedIndex.value = value,

          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.book),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.event),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications),
              label: '',
            ),
            NavigationDestination(
              icon: Icon(Icons.group),
              label: '',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value],)
    );
  }
}


class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [ const HomeScreen(), Container(color: Colors.green), Container(color: Colors.blue), const NotificationScreen(), Container(color: Colors.purple)];
}