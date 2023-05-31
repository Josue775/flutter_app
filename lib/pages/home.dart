import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';
import '../services/firebase_servide.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  Future<void> initializeFirebase() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  DataRow buildDataRow(Map<String, dynamic> product) {
    return DataRow(
      cells: [
        DataCell(Text(product['id'].toString())),
        DataCell(Text(product['nombre'])),
        DataCell(Text(product['status'].toString())),
        DataCell(Text(product['stock'].toString())),
        DataCell(
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Lógica para editar el producto
            },
          ),
        ),
        DataCell(
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              // Lógica para eliminar el producto
              deleteProducto(product['id'].toString());
            },
          ),
        ),
      ],
    );
  }

  List<DataColumn> buildDataColumns() {
    List<DataColumn> columns = [
      const DataColumn(
        label: Text('ID'),
      ),
      const DataColumn(
        label: Text('Nombre'),
      ),
      const DataColumn(
        label: Text('Estado'),
      ),
      const DataColumn(
        label: Text('Stock'),
      ),
      const DataColumn(
        label: Text('Editar'),
      ),
      const DataColumn(
        label: Text('Eliminar'),
      ),
    ];
    return columns;
  }

  Widget buildHome() {
    return const Center(
      child: Text('Hola'),
    );
  }

  Widget buildBusiness() {
    return const Center(
      child: Text('XD'),
    );
  }

  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: _selectedIndex == 0
          ? FutureBuilder(
              future: getProductos(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final dynamic rawData = snapshot.data;

                if (rawData == null) {
                  return const Center(
                    child: Text('No data available'),
                  );
                }

                final List<Map<String, dynamic>> productList =
                    List<Map<String, dynamic>>.from(rawData);

                if (productList.isEmpty) {
                  return const Center(
                    child: Text('No data available'),
                  );
                }

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: buildDataColumns(),
                    rows: productList.map<DataRow>(buildDataRow).toList(),
                  ),
                );
              },
            )
          : _selectedIndex == 1
              ? buildHome()
              : buildBusiness(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Pedidos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
        ],
      ),
    );
  }
}
