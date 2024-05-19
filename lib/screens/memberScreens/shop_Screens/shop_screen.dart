import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/memberScreens/shop_Screens/buy_screen.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:swimmast_movil/shared/swimmast_tabs.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            bottom: const PreferredSize(
              preferredSize: Size(double.infinity, 10),
              child: Text("Paquetes",
                  style: TextStyle(
                    fontSize: 23,
                    
                  )),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: 5,
                    itemBuilder: (_, index) => PaquetesInscripcion(
                      nomPaquete: 'Paquete',
                      descPaquete: 'lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      button: ElevatedButton(
                        onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BuyScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.yellow,
                        
                      ),
                      child: const Text('Inscribirse'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class DetallePaquete extends StatelessWidget {
  final String nomPaquete;
  final String descPaquete;
  final ElevatedButton button;

  const DetallePaquete({
    super.key,
    required this.nomPaquete,
    required this.descPaquete,
    required this.button,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nomPaquete,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Expanded(
              child: Text(
                descPaquete,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            
            Center(child: button,)
          ],
        ),
      ),
    );
  }
}

class PaquetesInscripcion extends StatelessWidget {
  final String nomPaquete;
  final String descPaquete;
  final ElevatedButton button;

  const PaquetesInscripcion(
      {super.key,
      required this.nomPaquete,
      required this.descPaquete,
      required this.button});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      child: SizedBox(
        height: 225,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: DetallePaquete(
                nomPaquete: nomPaquete,
                descPaquete: descPaquete,
                button: button,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
