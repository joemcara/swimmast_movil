import 'package:flutter/material.dart';
import 'package:swimmast_movil/screens/shop_Screens/buy_screen.dart';
import 'package:swimmast_movil/screens/shop_Screens/purchased_screen.dart';
import 'package:swimmast_movil/shared/swimmast_tabs.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';

import 'package:flutter/material.dart';

class ShopSportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String loren =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

    List<Map<String, String>> items = [
      {'paquete': 'Paquete 1', 'descripcion': loren, 'price': '10'},
      {'paquete': 'Paquete 2', 'descripcion': loren, 'price': '23'},
      {'paquete': 'Paquete 3', 'descripcion': loren, 'price': '60'},
      {'paquete': 'Paquete 4', 'descripcion': loren, 'price': '100'},
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Cursos Disponibles",
          onBackPressed: () => Navigator.pop(context),
          bottom: TabBar(
            tabs: [
              Tab(text: "Paquetes Disponibles"),
              Tab(text: "Comprados"),
            ],
            labelColor: Color.fromARGB(255, 240, 204, 0), // Color del texto de la pestaña seleccionada
            unselectedLabelColor: const Color.fromARGB(255, 255, 255, 255), // Color del texto de las pestañas no seleccionadas
            indicatorColor: Color.fromARGB(255, 240, 204, 0), // Color de la línea de la pestaña seleccionada
            indicatorWeight: 3.0, // Grosor de la línea del indicador
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: items.length,
              itemBuilder: (_, index) => PaquetesInscripcion(
                nomPaquete: items[index]['paquete']!,
                descPaquete: items[index]['descripcion']!,
                precio: items[index]['price']!,
                button: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyScreen(
                          nomPaquete: items[index]['paquete']!,
                          precio: items[index]['price']!,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.yellow,
                  ),
                  child: const Text('Inscribirse'),
                ),
              ),
            ),
            const PurchasedScreen(),
          ],
        ),
        
      ),
    );
  }
}

class DetallePaquete extends StatelessWidget {
  final String nomPaquete;
  final String descPaquete;
  final ElevatedButton button;
  final String precio;

  const DetallePaquete({
    Key? key,
    required this.nomPaquete,
    required this.descPaquete,
    required this.button,
    required this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nomPaquete,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              descPaquete,
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Text(
              'Precio: \$$precio',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Center(child: button),
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
  final String precio;

  const PaquetesInscripcion({
    Key? key,
    required this.nomPaquete,
    required this.descPaquete,
    required this.button,
    required this.precio,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetallePaquete(
      nomPaquete: nomPaquete,
      descPaquete: descPaquete,
      button: button,
      precio: precio,
    );
  }
}

class BuyScreen extends StatelessWidget {
  final String nomPaquete;
  final String precio;

  const BuyScreen({Key? key, required this.nomPaquete, required this.precio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nomPaquete),
      ),
      body: Center(
        child: Text('Comprar $nomPaquete por \$$precio'),
      ),
    );
  }
}

class PurchasedScreen extends StatelessWidget {
  const PurchasedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No hay paquetes comprados.'),
    );
  }
}
