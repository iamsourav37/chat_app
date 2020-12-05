import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseHelper {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot> getUserByUsername(String username) async {
    return await firestore
        .collection('users')
        .where('username', isEqualTo: username)
        .get();
  }

  Future<QuerySnapshot> getUserByEmail(String email) async {
    return await firestore
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
  }

  uploadUserInfo(Map<String, dynamic> userMap) {
    firestore.collection('users').add(userMap).catchError((onError) {
      print(onError.toString());
    });
  }
}
