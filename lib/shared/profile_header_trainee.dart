import 'package:swimmast_movil/shared/constants.dart';

class ProfileHeaderTrainee extends StatefulWidget {
  const ProfileHeaderTrainee({
    required this.username,
    this.onAvatarTap,
    required this.message,
  });

  final String username;
  final String message;
  final Function? onAvatarTap;

  @override
  ProfileHeaderTraineeState createState() => ProfileHeaderTraineeState();
}

class ProfileHeaderTraineeState extends State<ProfileHeaderTrainee> {
  String _message = '';

  @override
  void initState() {
    super.initState();
    _message = widget.message;
  }

  void updateMessage(String newMessage) {
    setState(() {
      _message = newMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    double sizeInPoints = 56.0; // Tamaño en puntos
    double sizeInPixels = sizeInPoints * devicePixelRatio;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: screenWidth,
          decoration: BoxDecoration(
            color: defaultGradient[0],
            /*borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)*/
          ),
          height: 80,
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  _message,
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
