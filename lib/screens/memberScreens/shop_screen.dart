import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:swimmast_movil/shared/swimmast_tabs.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> tabs = ["Paquetes", "Pago"];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 10),
              child: SwimmastTabs(
                tabNames: tabs,
              ),
            ),
          ),
          body: TabBarView(children: [
            Container(
              width: 20,
            ),
            Container(
              width: 20,
            )
          ])),
    );
  }
}
