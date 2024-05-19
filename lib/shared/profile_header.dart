import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/memberScreens/profile_screen.dart';
import 'package:swimmast_movil/shared/constants.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.username, this.onAvatarTap});
  final String username;
  final Function? onAvatarTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 25),
          child: Text(
            username,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            decoration: const BoxDecoration(
                color: swimmastBlue,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(150))),
            height: 120,
            width: 120,
            padding: const EdgeInsets.fromLTRB(35, 5, 5, 35),
            child: CustomAvatar(
                username: username,
                onTap: () {
                  if (onAvatarTap != null) onAvatarTap!();
                }))
      ],
    );
  }
}

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key, required this.username, required this.onTap});
  final String username;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(1000))),
                  child: CircleAvatar(
                    child: Text(
                      username[0],
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const Positioned(
                right: 5,
                child: Icon(
                  Icons.brightness_1,
                  color: Colors.red,
                  size: 25,
                ),
              )
            ],
          )),
    );
  }
}
