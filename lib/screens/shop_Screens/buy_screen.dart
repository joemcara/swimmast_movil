import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/profile_header.dart';

class BuyScreen extends StatelessWidget {
  const BuyScreen({super.key});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        leading: const Padding(
          padding: EdgeInsets.only(
            bottom: 25,
          ), // adjust as needed
          child: AlertWidget(),
        ),
        actions: const [
          ProfileHeader(
            username: "Username",
          ),
        ],
      ),
      body: const Center(
        child: Text('Comprar'),
      ),
    );
  }
}

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const BackButtonIcon(),
      iconSize: 35, // adjust as needed
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              surfaceTintColor: Colors.white,
              title: const Text('Salir de compra'),
              content: const Text(
                'Si usted sale de la compra, no se guardaran los datos ingresados.\n¿Desea salir?',
                style: TextStyle(fontSize: 18),
                ),
              actions: <Widget>[
                TextButton(
                  child: const Text('SI',
                  style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); 
                    Navigator.of(context).pop(); 
                  },
                ),
                                TextButton(
                  child: const Text(
                    'NO',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // close the dialog
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
