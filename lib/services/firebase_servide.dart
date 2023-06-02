import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List> getUsuarios2(String email, String password) async {
    List usuarios2 = [];
    
    // Realiza la consulta filtrando por el email y la contraseña
    QuerySnapshot queryUsuarios = await db
      .collection('usuarios')
      .where('email', isEqualTo: email)
      .where('psswd', isEqualTo: password)
      .get();

    // Recorre los documentos encontrados y agrega los datos a la lista de usuarios
    for (var documento in queryUsuarios.docs) {
      usuarios2.add(documento.data());
    }

    return usuarios2;
  }
}


// Future<List> getProductos() async{
//   List productos = [];
//   CollectionReference collectionReferenceProductos = db.collection('productos');
//   QuerySnapshot queryProductos = await collectionReferenceProductos.get();
//   for (var documento in queryProductos.docs) { 
//     productos.add(documento.data());
//   }
//   return productos;
// }
// Future<void> updateProducto(String id, Map<String, dynamic> newData) async {
//   CollectionReference collectionReferenceProductos = db.collection('productos');
//   await collectionReferenceProductos.doc(id).update(newData);
// }
// Future<void> deleteProducto(String id) async {
//   CollectionReference collectionReferenceProductos = db.collection('productos');
//   await collectionReferenceProductos.doc(id).delete();
// }
// Future<List> getUsuarios() async{
//   List usuarios = [];
//   CollectionReference collectionReferenceUsuarios = db.collection('usuarios');
//   QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();
//   for (var documento in queryUsuarios.docs) { 
//     usuarios.add(documento.data());
//   }

//   return usuarios;
// }