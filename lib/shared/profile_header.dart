import 'dart:io';
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
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
            height: 120,
            width: 120,
            padding: const EdgeInsets.fromLTRB(35, 5, 5, 35),
            child: CustomAvatar(
                username: username[0].toUpperCase(),
                onTap: () {
                  if (onAvatarTap != null) onAvatarTap!();
                }))
      ],
    );
  }
}

class CustomAvatar extends StatelessWidget {
  final String username;
  final Function onTap;
  File? image;
  CustomAvatar(
      {super.key, required this.username, required this.onTap, this.image});

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
                  padding: const EdgeInsets.all(5),
                  child: CircleAvatar(
                      child: image != null
                          ? ClipOval(
                              child: Image.file(
                                image!,
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                              ),
                            )
                          : Text(
                              username,
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            )),
                ),
              ),

            ],
          )),
    );
  }
}
