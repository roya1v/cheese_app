import 'package:cheese_app/model/cheese.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheesesRepository {
  final _firestore = FirebaseFirestore.instance;

  Stream<List<Cheese>> getCheesesStream() {
    return _firestore
        .collection('cheeses')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .asyncMap((snapshot) async {
      List<Cheese> result = [];
      for (int i = 0; i < snapshot.docs.length; i++) {
        final doc = snapshot.docs[i];
        final login = await getAuthorLogin(doc.get('author'));
        final data = doc.data();
        result.add(Cheese(
            body: data['body'],
            createdAt: (data['timestamp'] as Timestamp).toDate(),
            author: login));
      }
      return result;
    });
  }

  Future<String> getAuthorLogin(String id) async {
    var user = await _firestore.collection('users').doc(id).get();
    if (user.data() == null) {
      throw Exception('User not found');
    }
    return user.data()!['name'];
  }

  Future<void> create({required Cheese cheese}) async {
    await _firestore.collection('cheeses').add({
      'body': cheese.body,
      'timestamp': Timestamp.now(),
      'author': FirebaseAuth.instance.currentUser!.uid
    });
  }
}
