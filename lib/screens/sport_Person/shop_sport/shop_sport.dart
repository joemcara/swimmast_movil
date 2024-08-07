import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/shared/constants.dart';
import 'package:flutter/services.dart';

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
          bottom: TabBar(
            tabs: [
              Tab(text: "Paquetes Disponibles"),
              Tab(text: "Comprados"),
            ],
            labelColor: Color.fromARGB(
                255, 240, 204, 0), // Color del texto de la pestaña seleccionada
            unselectedLabelColor: const Color.fromARGB(255, 255, 255,
                255), // Color del texto de las pestañas no seleccionadas
            indicatorColor: Color.fromARGB(255, 240, 204,
                0), // Color de la línea de la pestaña seleccionada
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
                    foregroundColor: buttoncolorblue,
                    backgroundColor: buttoncoloryellow,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final List<Map<String, String>> _personDetails = [
      {'name': 'Evelyn Smith', 'id': '0956325689'},
    ];

    return Scaffold(
        appBar: CustomAppBar(
          title: 'Comprar $nomPaquete',
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: screenWidth * 0.02),
                    WidgetInfoBuy(
                        personDetails: _personDetails, nomPaquete: nomPaquete),
                    SizedBox(height: screenWidth * 0.02),
                    WidgetButtons(precio: double.parse(precio)),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class WidgetButtons extends StatefulWidget {
  final double precio;

  const WidgetButtons({
    Key? key,
    required this.precio,
  }) : super(key: key);

  @override
  _WidgetButtonsState createState() => _WidgetButtonsState();
}

class _WidgetButtonsState extends State<WidgetButtons> {
  bool _isAmountVisible = false;
  bool _isReserveButtonVisible = false;
  TextEditingController _amountController = TextEditingController();
  bool _isTransferVisible = false;
  bool _isCashVisible = false;
  bool _isAnyButtonVisibleTran = true;
  bool _isAnyButtonVisibleEfec = true;

  final List<Map<String, String>> _accountDetails = [
    {
      'name': 'Espinoza Wilson',
      'id': 'CI: 0956325689',
      'email': 'trasta7@gmail.com',
    },
  ];

  final List<Map<String, String>> _bankDetails = [
    {
      'bankName': 'Banco Guayaquil',
      'account': 'Ahorro #0015095639',
    },
    {
      'bankName': 'Banco Pichincha',
      'account': 'Ahorro #0015236789',
    },
  ];

  @override
  void initState() {
    super.initState();
    _amountController.text = '00.00'; // No incluye el signo '$' aquí
  }

  void _toggleTransfer() {
    setState(() {
      if (_isAnyButtonVisibleTran) {
        _isTransferVisible = !_isTransferVisible;
        _isAnyButtonVisibleEfec = false;
        if (!_isTransferVisible) {
          _isAnyButtonVisibleEfec = true;
        }
      } 
    });
  }

  void _toggleEfectivo() {
    setState(() {
      if (_isAnyButtonVisibleEfec) {
        _isCashVisible = !_isCashVisible;
        _isAnyButtonVisibleTran = false;
        if (!_isCashVisible) {
          _isAnyButtonVisibleTran = true;
        }
      } 
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Icon(Icons.credit_score, color: buttoncolorblue),
            SizedBox(width: 8.0),
            Text(
              'Opciones de pago',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: buttoncolorblue,
                fontSize: screenWidth * 0.04,
              ),
            ),
          ],
        ),
        Divider(),
        Visibility(
          visible: _isAnyButtonVisibleTran,
          child: Column(
            children: [
              PaymentOptionCard(
                icon: Icons.account_balance,
                title: 'Transferencia Bancaria',
                description: 'Realiza una transferencia bancaria.',
                onTap: _toggleTransfer,
                isSelected: _isTransferVisible,
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isTransferVisible,
          child: Column(
            children: [
              SizedBox(height: screenWidth * 0.02),
              WidgetInfoBank(
                accountDetails: _accountDetails,
                bankDetails: _bankDetails,
              ),
              TransferSection(
                precio: '100.00',
                amountController: TextEditingController(),
                isAmountVisible: _isAmountVisible,
                onToggleAmountVisibility: () {
                  setState(() {
                    _isAmountVisible = !_isAmountVisible;
                  });
                },
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isAnyButtonVisibleEfec,
          child: Column(
            children: [
              PaymentOptionCard(
                icon: Icons.money,
                title: 'Pago en Efectivo',
                description: 'Paga en efectivo en nuestras oficinas.',
                onTap: _toggleEfectivo,
                isSelected: _isCashVisible,
              ),
            ],
          ),
        ),
        Visibility(
          visible: _isCashVisible,
          child: Column(
            children: [
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttoncoloryellow,
                    foregroundColor: buttoncolorblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.04,
                      horizontal: screenWidth * 0.02,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Reservar Cupo por 24hrs",
                    style: TextStyle(fontSize: screenWidth * 0.05),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

class WidgetInfoBuy extends StatelessWidget {
  const WidgetInfoBuy({
    super.key,
    required List<Map<String, String>> personDetails,
    required this.nomPaquete,
  }) : _personDetails = personDetails;

  final List<Map<String, String>> _personDetails;
  final String nomPaquete;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final TextStyle textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: buttoncolorblue,
      fontSize: screenWidth * 0.04,
    );

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.receipt, color: buttoncolorblue),
              SizedBox(width: screenWidth * 0.02),
              Text('Detalle de pago', style: textStyle),
            ],
          ),
          Divider(),
          SizedBox(height: screenWidth * 0.02),
          Row(
            children: [
              Icon(Icons.person, color: buttoncolorblue),
              SizedBox(width: screenWidth * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: ${_personDetails[0]['name']}',
                      style: textStyle),
                  Text('Cédula: ${_personDetails[0]['id']}', style: textStyle),
                ],
              ),
            ],
          ),
          Divider(),
          SizedBox(height: screenWidth * 0.02),
          Row(
            children: [
              Icon(Icons.shopping_cart, color: buttoncolorblue),
              SizedBox(width: 8.0),
              Text('Paquete: $nomPaquete', style: textStyle),
            ],
          ),
          SizedBox(height: screenWidth * 0.04),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total a pagar:', style: textStyle),
              Text('\$10.00', style: textStyle),
            ],
          ),
        ],
      ),
    );
  }
}

class WidgetInfoBank extends StatelessWidget {
  const WidgetInfoBank({
    super.key,
    required List<Map<String, String>> accountDetails,
    required List<Map<String, String>> bankDetails,
  })  : _accountDetails = accountDetails,
        _bankDetails = bankDetails;

  final List<Map<String, String>> _accountDetails;
  final List<Map<String, String>> _bankDetails;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black12, Colors.black12],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_circle, color: buttoncolorblue),
              SizedBox(width: screenWidth * 0.02),
              Text('Detalle de la cuenta a pagar',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: buttoncolorblue,
                      fontSize: screenWidth * 0.04)),
            ],
          ),
          Divider(),
          SizedBox(height: screenWidth * 0.02),
          for (var account in _accountDetails)
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: buttoncolorblue,
                  size: screenWidth * 0.09,
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.02),
                  child: _accountDetail(
                      account['name']!, account['id']!, account['email']!),
                ),
              ],
            ),
          SizedBox(height: screenWidth * 0.02),
          Divider(),
          Row(
            children: [
              IconBank(screenWidth: screenWidth),
              SizedBox(width: screenWidth * 0.02),
              _buildBankColumn('Banco Guayaquil', _bankDetails, screenWidth),
              SizedBox(width: screenWidth * 0.01),
              IconBank(screenWidth: screenWidth),
              SizedBox(width: screenWidth * 0.02),
              _buildBankColumn('Banco Pichincha', _bankDetails, screenWidth),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Divider(),
        ],
      ),
    );
  }
}

class IconBank extends StatelessWidget {
  const IconBank({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.account_balance,
      color: buttoncolorblue,
      size: screenWidth * 0.07,
    );
  }
}

Widget _accountDetail(String name, String id, String email) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        name,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: buttoncolorblue, fontSize: 14),
      ),
      Text(
        id,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: buttoncolorblue, fontSize: 14),
      ),
      Text(
        email,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: buttoncolorblue, fontSize: 14),
      ),
    ],
  );
}

Widget _bankDetail(String bankName, String account) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bankName,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: buttoncolorblue,
              fontSize: 14),
        ),
        Text(
          account,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: buttoncolorblue,
              fontSize: 14),
        ),
      ],
    ),
  );
}

Widget _buildBankColumn(String bankName, List<Map<String, String>> _bankDetails,
    double screenWidth) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var bank
            in _bankDetails.where((bank) => bank['bankName'] == bankName))
          Padding(
            padding: EdgeInsets.only(top: screenWidth * 0.02),
            child: _bankDetail(
              bank['bankName']!,
              bank['account']!,
            ),
          ),
      ],
    ),
  );
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;
  final bool isSelected;

  PaymentOptionCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: isSelected ? buttoncolorblue : Colors.white,
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        leading: Icon(
          icon,
          size: 40,
          color: isSelected ? Colors.white : buttoncolorblue,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : buttoncolorblue,
          ),
        ),
        subtitle: Text(
          description,
          style: TextStyle(
            color: isSelected ? Colors.white : buttoncolorblue,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class TransferSection extends StatelessWidget {
  final String precio;
  final TextEditingController amountController;
  final bool isAmountVisible;
  final VoidCallback onToggleAmountVisibility;

  TransferSection({
    required this.precio,
    required this.amountController,
    required this.isAmountVisible,
    required this.onToggleAmountVisibility,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttoncolorblue,
                    foregroundColor: buttoncoloryellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.03,
                        horizontal: screenWidth * 0.01),
                  ),
                  onPressed: () {
                    // Acción al presionar "Pagar valor total"
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$ $precio",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Pagar valor total",
                        style: TextStyle(fontSize: screenWidth * 0.03),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: buttoncolorblue,
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.02,
                        horizontal: screenWidth * 0.02),
                    backgroundColor: Colors.transparent,
                    side: BorderSide.none,
                  ),
                  onPressed: () {
                    // Acción al presionar "Subir comprobante"
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_file, color: buttoncolorblue),
                      SizedBox(width: screenWidth * 0.02),
                      Text(
                        "Subir\ncomprobante",
                        style: TextStyle(
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttoncolorblue,
                  foregroundColor: buttoncoloryellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.05,
                      horizontal: screenWidth * 0.05),
                ),
                onPressed: onToggleAmountVisibility,
                child: Text(
                  "Agregar monto",
                  style: TextStyle(fontSize: screenWidth * 0.04),
                ),
              ),
              SizedBox(width: screenWidth * 0.05),
              Visibility(
                visible: isAmountVisible,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.02,
                      horizontal: screenWidth * 0.01),
                  child: Container(
                    width: screenWidth * 0.3,
                    child: TextField(
                      controller: amountController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}')),
                      ],
                      decoration: InputDecoration(
                        labelText: 'Monto',
                        border: OutlineInputBorder(),
                        prefixText: '\$',
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.03),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttoncoloryellow,
                    foregroundColor: buttoncolorblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: screenWidth * 0.04,
                        horizontal: screenWidth * 0.02),
                  ),
                  onPressed: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enviar Pago",
                        style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 16.0),
            ],
          ),
        ],
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
