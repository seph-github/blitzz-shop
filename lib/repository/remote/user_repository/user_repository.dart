import 'dart:async';

import 'package:blitzz_shop/database/remote/firebase_database.dart';
import 'package:blitzz_shop/model/user/user_model.dart';
import 'package:blitzz_shop/repository/path/user_path/user_db_path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  final database = ref.watch(firebaseDatabaseProvider);
  return UserRepository(database);
}

class UserRepository {
  final FirebaseDatabase _database;

  UserRepository(this._database);

  Future<UserModel?> findAdminById(String id) async {
    final user = await _database.getData(
      path: UserDbPath.user(id),
      builder: (data, _) {
        return UserModel.fromJson(data);
      },
    );

    return user;
  }
}
