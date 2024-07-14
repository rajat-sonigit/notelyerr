import 'package:cloud_firestore/cloud_firestore.dart';

void _storeUserData(String email, String name) async {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  await users.add({
    'email': email,
    'name': name,
  });
  print("name added userdata");
}
