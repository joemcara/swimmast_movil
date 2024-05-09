import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';

class SwimmastTabs extends StatelessWidget {
  final List<String> tabNames;
  const SwimmastTabs({super.key, required this.tabNames});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(border: Border.all(color: system_blue)),
      child: TabBar(
        tabAlignment: TabAlignment.fill,
        enableFeedback: false,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: BoxDecoration(
          color: system_blue,
          borderRadius: BorderRadius.circular(0),
        ),
        tabs: tabNames
            .map((e) => Tab(
                  text: e,
                ))
            .toList(),
      ),
    );
  }
}
