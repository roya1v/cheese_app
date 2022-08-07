import 'package:cheese_app/model/cheese.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheesesRepository {
  Stream<List<Cheese>> getCheesesStream() {
    return FirebaseFirestore.instance
        .collection('cheeses')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        return Cheese(
            body: data['body'],
            createdAt: (data['timestamp'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> create({required Cheese cheese}) async {
    await FirebaseFirestore.instance
        .collection('cheeses')
        .add({'body': cheese.body, 'timestamp': Timestamp.now()});
  }
}
