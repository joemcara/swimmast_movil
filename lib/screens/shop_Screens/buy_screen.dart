import 'package:flutter/material.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/inputs.dart';

import 'package:swimmast_movil/shared/profile_header.dart';
import 'package:image_picker/image_picker.dart';

class BuyScreen extends StatefulWidget {
  final String nomPaquete;
  final String precio;
  const BuyScreen({
    super.key,
    required this.nomPaquete,
    required this.precio,
  });

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  bool _isVisible = true;
  bool _photoVisible = false;

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
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Detalle de pago',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 10),
                CardBuyPaquete(
                    nomPaquete: widget.nomPaquete, precio: widget.precio),
                Visibility(
                  visible: _isVisible,
                  child: Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Seleccione el método de pago',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TransferButton(
                          onPressed: () {
                            setState(() {
                              _isVisible = !_isVisible;
                            });
                          },
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: swimmastBlue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            minimumSize: const Size(150, 60),
                            backgroundColor: Colors.white,
                            foregroundColor: swimmastBlue,
                          ),
                          child: const Text('Pago en efectivo'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Visibility(
                  visible: !_isVisible,
                  child: Column(
                    children: [
                      Container(
                        width: 500,
                        height: 200,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Wilson Espinoza'),
                            const Text('CI: 0956325689'),
                            const SizedBox(height: 10.0),
                            //implement list view
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 100,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return TransferCard(
                                    nomBanco: 'Banco Pichincha',
                                    ctaAhorro: '2200000001',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Opciones de Pago",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          )),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: const BorderSide(color: swimmastBlue),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              minimumSize: const Size(1, 50),
                              backgroundColor: Colors.white,
                              foregroundColor: swimmastBlue,
                            ),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '\$${widget.precio}\n',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.black // adjust as needed
                                        ),
                                  ),
                                  const TextSpan(
                                    text: 'Total a pagar',
                                    style: TextStyle(
                                        color: Colors.black // adjust as needed
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              // Handle the button press here
                            },
                            child:const  Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Enviar \ncomprobante',
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    
                                    fontSize: 15,
                                  ),
                                ),
                                Icon(Icons.photo_library_sharp,
                                    size: 20), // Add your icon here
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _photoVisible = !_photoVisible;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              minimumSize: const Size(130, 50),
                              backgroundColor: swimmastBlue,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Otro monto'),
                          ),
                          const SizedBox(width: 30),
                          Visibility(
                            visible: _photoVisible,
                            child: const SizedBox(
                              width: 100,
                              child: TextInput(
                                hintText: '\$0.00',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        visible: _photoVisible,
                        child: Center(
                            child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('Enviar Pago'),
                        )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class TransferCard extends StatelessWidget {
  final String nomBanco;
  final String ctaAhorro;
  final String? email;

  const TransferCard({
    super.key,
    required this.nomBanco,
    required this.ctaAhorro,
    this.email,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              surfaceTintColor: Colors.white30,
              title: Text('Cuenta de Transferencia'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Banco: $nomBanco'),
                    SelectableText('Cta Ahorro: $ctaAhorro'),
                    Text('Email: ${email ?? 'No tiene'}'),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('salir'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                nomBanco,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                const Text(
                  'CTA Ahorro #',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(' $ctaAhorro'),
              ],
            ),
            if (email != null)
              Row(
                children: [
                  const Text(
                    'Correo: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(email!),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class TransferButton extends StatelessWidget {
  final VoidCallback onPressed;
  const TransferButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size(150, 60),
        backgroundColor: swimmastBlue,
        foregroundColor: Colors.white,
      ),
      child: const Text('Transferencia\n  \t bancaria'),
    );
  }
}

class CardBuyPaquete extends StatelessWidget {
  final String nomPaquete;
  final String precio;

  const CardBuyPaquete({
    super.key,
    required this.nomPaquete,
    required this.precio,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nomPaquete),
          const Text('Evelyn Smith'),
          const Text('CI: 0956325689'),
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Text(
              'Total a pagar: \$$precio',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
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
                style: TextStyle(fontSize: 16),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text(
                    'SI',
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
