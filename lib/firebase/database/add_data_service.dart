import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

mixin AddDataService {
  final _db = FirebaseFirestore.instance;

  Future<void> addDocument({
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db.collection(collection).add({
        ...data,
        "timestamp": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      debugPrint("Error adding document - $e");
    }
  }

  Future<void> createDocument({
    required String document,
    required String collection,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _db.collection(collection).doc(document).set({
        ...data,
        "timestamp": FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint("Error creating document - $e");
    }
  }
}
