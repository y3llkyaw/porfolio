import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:porfolio_yhk/app/data/models/education_model.dart';

class EducationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collectionPath = 'educations';

  Future<List<Education>> getEducations() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection(_collectionPath).orderBy('order').get();
      return querySnapshot.docs
          .map((doc) => Education.fromMap(doc.data() as Map<String, dynamic>, doc.id))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> addEducation(Education education) {
    return _firestore.collection(_collectionPath).add(education.toMap());
  }

  Future<void> updateEducation(Education education) {
    return _firestore
        .collection(_collectionPath)
        .doc(education.id)
        .update(education.toMap());
  }

  Future<void> deleteEducation(String id) {
    return _firestore.collection(_collectionPath).doc(id).delete();
  }
}