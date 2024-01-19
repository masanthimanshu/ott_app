import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddDataService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db.collection(collection).add(data);
    } catch (e) {
      _handleError(e, "Error adding document");
    }
  }

  Future<void> createDocument({
    required String document,
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db
          .collection(collection)
          .doc(document)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      _handleError(e, "Error creating document");
    }
  }

  void _handleError(Object error, String message) {
    if (error is FirebaseException) {
      debugPrint("$message - ${error.message}");
    } else {
      debugPrint("$message - $error");
    }
  }
}
