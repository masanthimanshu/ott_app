import 'package:cloud_firestore/cloud_firestore.dart';

mixin GetDataService {
  final _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>?> getCollectionData({
    required String collection,
  }) async {
    final res = await _db.collection(collection).get();

    if (res.docs.isNotEmpty) {
      final allData = res.docs.map((e) => e.data()).toList();
      return allData;
    }

    return null;
  }

  Future<Map<String, dynamic>?> getDocumentData({
    required String collection,
    required String document,
  }) async {
    final res = await _db.collection(collection).doc(document).get();
    return res.data();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getCollectionStream({
    required String collection,
  }) {
    final res = _db.collection(collection).snapshots();
    return res;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getDocumentStream({
    required String document,
    required String collection,
  }) {
    final res = _db.collection(collection).doc(document).snapshots();
    return res;
  }
}
