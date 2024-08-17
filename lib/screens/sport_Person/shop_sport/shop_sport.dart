import 'dart:ffi';

import 'package:image_picker/image_picker.dart';
import 'package:swimmast_movil/models/utils.dart';
import 'package:swimmast_movil/screens/member_Screens/bottomNav/main_screen_member.dart';
import 'package:swimmast_movil/screens/sport_Person/bottonNav/main_screen_sport.dart';
import 'package:swimmast_movil/screens/sport_Person/shop_sport/purchased_screen.dart';
import 'package:swimmast_movil/widgets/customAppBar.dart';
import 'package:swimmast_movil/shared/constants.dart';

import 'package:swimmast_movil/models/courseAvailable.dart';

class ShopSportScreen extends StatefulWidget {
  @override
  State<ShopSportScreen> createState() => _ShopSportScreenState();
}

class _ShopSportScreenState extends State<ShopSportScreen> {
  List<Map<String, String>> items = [];

  Future<void> _AvilableShopCourse() async {
    try {
      final response = await Dio().get(
        urlBack + 'course/swimmer/' + idUser.toString() + '/catalog/',
      );

      for (var item in response.data) {
        CourseAvailable course = CourseAvailable.fromJson(item);
        Map<String, String> courseMap = {
          'id': course.id.toString(),
          'paquete': course.name,
          'descripcion': course.description,
          'price': course.price,
          'startDate': course.startDate.toString().split(' ')[0],
          'dueDate': course.dueDate.toString().split(' ')[0],
        };
        items.add(courseMap);
      }
      setState(() {});
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  void initState() {
    super.initState();
    _AvilableShopCourse();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "Cursos Disponibles",
          back: true,
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
                idCourse: items[index]['id']!,
                nomPaquete: items[index]['paquete']!,
                descPaquete: items[index]['descripcion']!,
                precio: items[index]['price']!,
                startDate: items[index]['startDate']!,
                dueDate: items[index]['dueDate']!,
                button: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyScreen(
                          idCourse: items[index]['id']!,
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
  final String startDate;
  final String dueDate;

  const DetallePaquete({
    Key? key,
    required this.nomPaquete,
    required this.descPaquete,
    required this.button,
    required this.precio,
    required this.startDate,
    required this.dueDate,
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
            const SizedBox(height: 10),
            Text(
              'Fecha inicio: $startDate',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Fecha Fin: $dueDate',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Center(child: button),
          ],
        ),
      ),
    );
  }
}

class PaquetesInscripcion extends StatelessWidget {
  final String idCourse;
  final String nomPaquete;
  final String descPaquete;
  final ElevatedButton button;
  final String precio;
  final String startDate;
  final String dueDate;

  const PaquetesInscripcion({
    Key? key,
    required this.nomPaquete,
    required this.descPaquete,
    required this.button,
    required this.precio,
    required this.startDate,
    required this.dueDate,
    required this.idCourse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DetallePaquete(
      nomPaquete: nomPaquete,
      descPaquete: descPaquete,
      button: button,
      startDate: startDate,
      dueDate: dueDate,
      precio: precio,
    );
  }
}

class BuyScreen extends StatelessWidget {
  final String idCourse;
  final String nomPaquete;
  final String precio;

  const BuyScreen(
      {Key? key,
      required this.nomPaquete,
      required this.precio,
      required this.idCourse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final List<Map<String, String>> _personDetails = [
      {'name': '${miembro!.user.firstName}${miembro!.user.lastName}'},
    ];

    return Scaffold(
        appBar: AppBar(
          leading: AlertWidget(),
          title: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Comprar $nomPaquete',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: defaultGradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
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
                      personDetails: _personDetails,
                      nomPaquete: nomPaquete,
                      precio: precio,
                    ),
                    SizedBox(height: screenWidth * 0.02),
                    WidgetButtons(
                      precio: double.parse(precio),
                      nomPaquete: nomPaquete,
                      idCourse: idCourse,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}

class WidgetButtons extends StatefulWidget {
  final String idCourse;
  final double precio;
  final String nomPaquete;
  const WidgetButtons({
    Key? key,
    required this.precio,
    required this.nomPaquete,
    required this.idCourse,
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
                idCourse: widget.idCourse,
                precio: widget.precio,
                course: widget.nomPaquete,
                amountController: TextEditingController(),
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
  WidgetInfoBuy({
    super.key,
    required List<Map<String, String>> personDetails,
    required this.nomPaquete,
    required this.precio,
  }) : _personDetails = personDetails;

  final List<Map<String, String>> _personDetails;
  final String nomPaquete;
  var precio;

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
              Flexible(
                child: Text(
                  'Paquete: $nomPaquete',
                  style: textStyle,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          SizedBox(height: screenWidth * 0.04),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total a pagar:', style: textStyle),
              Text('\$ $precio', style: textStyle),
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

class TransferSection extends StatefulWidget {
  final String idCourse;
  final double precio;
  final String course;
  final TextEditingController amountController;
  final VoidCallback onToggleAmountVisibility;

  TransferSection({
    required this.precio,
    required this.course,
    required this.amountController,
    required this.onToggleAmountVisibility,
    required this.idCourse,
  });

  _TransferSectionState createState() => _TransferSectionState();
}

class _TransferSectionState extends State<TransferSection> {
  bool isPaymentEnabled = false;
  bool isEnabledPhoto = false;
  bool isFullPayment = true;
  bool isAmountVisible = true;

  bool selectfullpayment = false;
  bool selectamountpayment = false;

  XFile? selectedImage;
  Color uploadTextColor = buttoncolorblue;
  final FocusNode _focusNode = FocusNode();

  final ImagePicker _picker = ImagePicker();

  Future<void> _onUploadPhoto() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Seleccionar imagen'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Tomar foto'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.camera);

                  if (image != null) {
                    setState(() {
                      selectedImage = image;
                      isEnabledPhoto = true;
                      uploadTextColor = Colors.green;
                      _updatePaymentStatus();
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Seleccionar desde galería'),
                onTap: () async {
                  Navigator.pop(context);
                  final XFile? image =
                      await _picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      selectedImage = image;
                      isEnabledPhoto = true;
                      uploadTextColor = Colors.green;
                      _updatePaymentStatus();
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _updatePaymentStatus() {
    setState(() {
      if (widget.amountController.text.isNotEmpty || isEnabledPhoto == true) {
        isPaymentEnabled = true;
      }
    });
  }

  void _updateFullPayment() {
    setState(() {
      selectfullpayment = !selectfullpayment;
      if (selectfullpayment) {
        isEnabledPhoto = true;
        isAmountVisible = false;
      } else {
        isEnabledPhoto = false;
        isAmountVisible = true;
      }
    });
  }

  void _updateAmountPayment() {
    setState(() {
      selectamountpayment = !selectamountpayment;
      if (selectamountpayment) {
        isEnabledPhoto = true;
        isFullPayment = false;
      } else {
        isEnabledPhoto = false;
        isFullPayment = true;
      }
    });
  }

  void showModal(String errorMessage, BuildContext contextParent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Informacion!"),
          content: Text(errorMessage),
          actions: <Widget>[
            new TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
                if (miembro!.roleName == "DEPORTISTA") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreenMember()));
                } else if (miembro!.roleName == "DEPORTISTA") {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MainScreenSportPerson()));
                }
              },
            ),
          ],
        );
      },
    );
  }

  Future<int> _generateEnrollment(
      double paymentValue, String reciptUrl, int courseId) async {
    try {
      final response = await Dio().post(
        urlBack + 'enrollment/generate_enrollment/',
        data: {
          "course": courseId,
          "applicant": idUser,
          "payment_value": paymentValue,
          "receipt_url": reciptUrl,
        },
      );
      if (response.statusCode == 200) {
        showModal("Pago realizado con éxito", context);
      } else {
        showModal("Error al realizar el pago", context);
      }
      return 200;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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
              Visibility(
                visible: isFullPayment,
                child: Expanded(
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
                      _updateFullPayment();
                      setState(() {
                        widget.amountController.text = widget.precio.toString();
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "\$ ${widget.precio.toStringAsFixed(2)}",
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
              ),
              SizedBox(width: screenWidth * 0.02),
              Visibility(
                visible: isAmountVisible,
                child: Expanded(
                  child: ElevatedButton(
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
                    //onPressed: widget.onToggleAmountVisibility,
                    onPressed: () {
                      _updateAmountPayment();
                    },
                    child: Text(
                      "Abonar",
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isEnabledPhoto,
                child: Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: uploadTextColor,
                      padding: EdgeInsets.symmetric(
                          vertical: screenWidth * 0.02,
                          horizontal: screenWidth * 0.02),
                      backgroundColor: Colors.transparent,
                      side: BorderSide.none,
                    ),
                    onPressed: isEnabledPhoto
                        ? () {
                            // Acción al presionar "Subir comprobante"
                            _onUploadPhoto();
                          }
                        : null,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file, color: uploadTextColor),
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
              ),
              SizedBox(width: screenWidth * 0.02),
            ],
          ),
          SizedBox(height: screenWidth * 0.02),
          Row(
            mainAxisAlignment: selectamountpayment
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.center,
            children: [
              Visibility(
                visible: selectamountpayment,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.05,
                      horizontal: screenWidth * 0.05),
                  child: Text(
                    "Monto a abonar:",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: buttoncolorblue),
                  ),
                ),
              ),
              Visibility(
                visible: selectamountpayment,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.02,
                      horizontal: screenWidth * 0.01),
                  child: Container(
                    width: screenWidth * 0.3,
                    child: TextField(
                      controller: widget.amountController,
                      focusNode: _focusNode,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: '\$00.00',
                        labelText: 'Monto',
                        border: OutlineInputBorder(),
                        prefixText: '\$',
                      ),
                      style: TextStyle(fontSize: screenWidth * 0.03),
                      onChanged: (_) => _updatePaymentStatus(),
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
                  onPressed: isPaymentEnabled
                      ? () async {
                          String urltemp = await Utils.uploadImage(
                              "${miembro!.user.username}/comprobantes/",
                              "${widget.course}-1",
                              selectedImage!);
                          double amount =
                              double.parse(widget.amountController.text);
                          _generateEnrollment(
                              amount, urltemp, int.parse(widget.idCourse));
                        }
                      : null,
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

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const BackButtonIcon(),
      iconSize: 25,
      color: Colors.white,
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
