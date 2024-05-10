import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/memberScreens/shop_Screens/buy_screen.dart';
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
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (_,index) =>
                  const PaquetesInscripcion()
                  ),
              ),
            ],
          )),
    );
  }
}

class PaquetesInscripcion extends StatefulWidget {
  const PaquetesInscripcion({
    super.key,
  });

  @override
  State<PaquetesInscripcion> createState() => _PaquetesInscripcionState();
}

class _PaquetesInscripcionState extends State<PaquetesInscripcion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
          //padding
          
      child: Center(
        child: Card.outlined(
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 90, vertical: 10),
          //padding
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                'Paquete X',
                style: TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                  context,
                   MaterialPageRoute(
                    builder: (context) => const BuyScreen()));
                  // Handle the button press
                },
                child: const Text('Inscribirse'),
              ),
              // SizedBox(height: 8.0),
              const Text(
                '\$10',
                style: TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
