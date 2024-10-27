import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:production/models/sample_model.dart';

class FirestoreSampleRepository {
  final FirebaseFirestore _firestore;

  FirestoreSampleRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  final String collectionPath = 'sample_collection';

  Future<String> addSample(SampleModel sample) async {
    try {
      DocumentReference docRef =
          await _firestore.collection(collectionPath).add(sample.toJson());
      return docRef.id;
    } catch (e) {
      throw Exception('Failed to add sample data: $e');
    }
  }

  Future<SampleModel?> getSampleById(String docId) async {
    try {
      DocumentSnapshot docSnapshot =
          await _firestore.collection(collectionPath).doc(docId).get();
      if (docSnapshot.exists) {
        // ドキュメントIDを含めてインスタンスを生成
        return SampleModel.fromJson(docSnapshot.data() as Map<String, dynamic>)
            .copyWith(id: docSnapshot.id);
      }
      return null;
    } catch (e) {
      throw Exception('Failed to get sample data: $e');
    }
  }

  Future<List<SampleModel>> getAllSamples() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection(collectionPath).get();
      return querySnapshot.docs.map((doc) {
        return SampleModel.fromJson(doc.data() as Map<String, dynamic>)
            .copyWith(id: doc.id); // ドキュメントIDを設定
      }).toList();
    } catch (e) {
      throw Exception('Failed to get all sample data: $e');
    }
  }

  Future<void> updateSample(String docId, SampleModel sample) async {
    try {
      await _firestore
          .collection(collectionPath)
          .doc(docId)
          .update(sample.toJson());
    } catch (e) {
      throw Exception('Failed to update sample data: $e');
    }
  }

  Future<void> deleteSample(String docId) async {
    try {
      await _firestore.collection(collectionPath).doc(docId).delete();
    } catch (e) {
      throw Exception('Failed to delete sample data: $e');
    }
  }
}
