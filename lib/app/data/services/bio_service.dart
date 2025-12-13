import 'package:cloud_firestore/cloud_firestore.dart';

class BioService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'bio';
  final String _documentId = 'bio_data';

  Future<String> getBio() async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection(_collectionPath).doc(_documentId).get();
      if (doc.exists) {
        return (doc.data() as Map<String, dynamic>)['content'] ?? '';
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    }
  }

  Future<void> updateBio(String content) {
    return _firestore
        .collection(_collectionPath)
        .doc(_documentId)
        .set({'content': content});
  }
}
