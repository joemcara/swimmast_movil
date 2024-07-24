import 'package:swimmast_movil/shared/constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: statusBarHeight * 1.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width) / 6.7),
                      Text("Cambiar contraseña", style: styleTitles),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 30.0,
                            alignment: WrapAlignment.center,
                            children: [
                              Center(
                                child: Container(
                                  height: 50,
                                  width: 300,
                                  // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(255, 58, 58, 58), width: 0.5),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      miembro!.username,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
