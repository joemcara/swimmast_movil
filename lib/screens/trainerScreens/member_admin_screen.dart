import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:swimmast_movil/widgets/memberTrainerAdmin.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:swimmast_movil/widgets/popover.dart';

class Memberadmin extends StatelessWidget {
  const Memberadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(20, 40, 0, 20),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                const ProfileHeader(username: "Luis")
              ]),
          const SizedBox(height: 10),
          const SizedBox(
            width: 360,
            child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)))),
          ),
          const SizedBox(height: 20),
          const Flexible(
            child: MemberAdminCards(),
          )
        ],
      ),
    );
  }
}

class MemberAdminCards extends StatefulWidget {
  const MemberAdminCards({super.key});

  @override
  MemberAdminCardsState createState() => MemberAdminCardsState();
}

class MemberAdminCardsState extends State<MemberAdminCards> {
  List<Widget> generateContainers(int count) {
    List<Widget> containers = [];
    for (int i = 0; i < count; i++) {
      containers.add(
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          width: 360,
          child: const Column(
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Evelyn Smith",
                        style: styleSubtitles,
                      ),
                      Text("12 años")
                    ],
                  ),
                  SizedBox(width: 135),
                  PopoverButton(),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(width: 10),
                  Membertraineradmin(),
                ],
              ),
            ],
          ),
        ),
      );
    }
    return containers;
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: generateContainers(5),
      ),
    );
  }
}
