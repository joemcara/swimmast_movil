import 'package:swimmast_movil/shared/constants.dart';

class ProfileHeaderTrainee extends StatelessWidget {
  const ProfileHeaderTrainee(
      {super.key, required this.username, this.onAvatarTap});
  final String username;
  final Function? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            width: screenWidth,
            decoration: const BoxDecoration(
                color: swimmastBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            height: 120,
            padding: const EdgeInsets.fromLTRB(35, 5, 5, 35),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
              child: Row(
                children: [
                  Text(
                    "Hola, $username",
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Stack(children: [
                    GestureDetector(
                      onTap: () {
                        if (onAvatarTap != null) onAvatarTap!();
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        minRadius: 40,
                      ),
                    ),
                    const Positioned(
                      right: -2,
                      child: Icon(
                        Icons.brightness_1,
                        color: Colors.red,
                        size: 25,
                      ),
                    )
                  ]),
                ],
              ),
            ))
      ],
    );
  }
}
