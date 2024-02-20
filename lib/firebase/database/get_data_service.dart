import 'package:cloud_firestore/cloud_firestore.dart';

mixin GetDataService {
  final _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getCollectionData(
    String collection,
  ) async {
    final res = await _db.collection(collection).get();

    if (res.docs.isNotEmpty) {
      final allData = res.docs.map((e) => e.data()).toList();
      return allData;
    }

    return [];
  }

  Future<Map<String, dynamic>?> getDocumentData({
    required String collection,
    required String document,
  }) async {
    final res = await _db.collection(collection).doc(document).get();
    return res.data();
  }

  Future<List<Map<String, dynamic>>> getFilteredData({
    required String collection,
    required String field,
    required String value,
  }) async {
    final query = _db.collection(collection).where(field, isEqualTo: value);
    final res = await query.get();

    final allData = res.docs.map((e) => e.data()).toList();
    return allData;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream({
    required String collection,
  }) {
    return _db.collection(collection).snapshots();
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDocumentStream({
    required String document,
    required String collection,
  }) {
    return _db.collection(collection).doc(document).snapshots();
  }
}
