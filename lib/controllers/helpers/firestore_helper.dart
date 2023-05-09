import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {
  FirestoreHelper._();

  static final FirestoreHelper firestoreHelper = FirestoreHelper._();

  static final FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> burgerRecords() {
    return db.collection("burger").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> drinkRecords() {
    return db.collection("drinks").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> recipeRecords() {
    return db.collection("recipes").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> snackRecords() {
    return db.collection("snacks").snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> pizzaRecords() {
    return db.collection("pizza").snapshots();
  }
}
