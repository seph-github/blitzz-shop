import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_storage.g.dart';

@riverpod
Reference firebaseReference(FirebaseReferenceRef ref) {
  return FirebaseStorage.instance.ref();
}

@riverpod
FirebaseStorageDb firebaseStorageDb(FirebaseStorageDbRef ref) {
  final storageRef = ref.watch(firebaseReferenceProvider);
  return FirebaseStorageDb(storageRef);
}

class FirebaseStorageDb {
  final Reference _storageRef;

  FirebaseStorageDb(this._storageRef);

  Future<String> uploadFile({required String path, required File file}) async {
    final filePathRef = _storageRef.child("$path/${basename(file.path)}");
    final taskResult = await filePathRef.putFile(file);
    return taskResult.ref.getDownloadURL();
  }
}
