import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class BerandaService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Object?>> streamProduk() {
    CollectionReference data = firestore.collection("produk");
    return data.snapshots();
  }

  Future<DocumentSnapshot<Object?>> getByIDProduk(String id) async {
    DocumentReference docRef = firestore.collection("produk").doc(id);
    return docRef.get();
  }
}