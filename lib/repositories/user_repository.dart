import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  DocumentReference get _user {
    final id = FirebaseAuth.instance.currentUser?.uid;
    if (id == null) {
      throw (Exception('User repository shouldn\'t be used if not signed in'));
    }
    return FirebaseFirestore.instance.collection('users').doc(id);
  }

  Future<String?> getGuildId() async {
    final userDict = await _user.get();
    return userDict['guild'];
  }

  Future<void> setGuildId(String id) async {
    await _user.update({'guild': id});
  }

  Future<void> setName(String name) async {
    await _user.set({'name': name});
  }
}
