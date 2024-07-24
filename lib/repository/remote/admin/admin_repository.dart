import 'dart:developer';
import 'dart:io';

import 'package:blitzz_shop/database/remote/firebase_database.dart';
import 'package:blitzz_shop/database/remote/firebase_storage.dart';
import 'package:blitzz_shop/model/shop/shop_model.dart';
import 'package:blitzz_shop/repository/path/admin_path/admin_db_path.dart';
import 'package:blitzz_shop/repository/remote/auth_repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admin_repository.g.dart';

@riverpod
AdminRepository adminRepository(AdminRepositoryRef ref) {
  final database = ref.watch(firebaseDatabaseProvider);
  return AdminRepository(database);
}

@riverpod
class CreateAdminAccount extends _$CreateAdminAccount {
  @override
  FutureOr<void> build() {}

  Future createAdminAccount({
    required String shopName,
    required String country,
    required String addressState,
    required String city,
    required String street1,
    required String zipcode,
    required String phoneNumber,
    required String ownersName,
  }) async {
    state = const AsyncLoading();

    final user = ref.read(authProvider).loggedUser;

    final adminRepository = ref.read(adminRepositoryProvider);

    final ShopModel shop = ShopModel(
      id: user?.uid ?? '',
      shopProfile: '',
      shopName: shopName,
      ownersName: ownersName,
      city: city,
      country: country,
      stateOrProvince: addressState,
      street1: street1,
      zipcode: zipcode,
      phoneNumber: phoneNumber,
      email: user?.email ?? '',
      isActive: true,
      createdDate: DateTime.now(),
    );

    state = await AsyncValue.guard(
      () async => await adminRepository.createAdminAccount(shop: shop),
    );
  }
}

@riverpod
class AdminNotifier extends _$AdminNotifier {
  @override
  Future<ShopModel?> build() async => await adminUser();

  Future<ShopModel?> adminUser() async {
    final user = ref.read(authProvider).loggedUser;
    final adminProvider = ref.read(adminRepositoryProvider);
    return await adminProvider.findAdminById(user?.uid ?? '');
  }
}

@riverpod
class AddShopProfileImage extends _$AddShopProfileImage {
  @override
  FutureOr<void> build() => null;

  Future<void> addShopProfileImage(File? file) async {
    state = const AsyncLoading();

    final user = ref.watch(authProvider).loggedUser;

    final adminRepository = ref.read(adminRepositoryProvider);

    final shop =
        await ref.watch(adminRepositoryProvider).findAdminById(user?.uid ?? '');

    final imageUrl = await ref.read(firebaseStorageDbProvider).uploadFile(
          path: AdminDbPath.admins(),
          file: file!,
        );

    final newShop = shop!.copyWith(shopProfile: imageUrl);

    state = await AsyncValue.guard(
      () async => await adminRepository.addShopProfileImage(shop: newShop),
    );
  }
}

class AdminRepository {
  final FirebaseDatabase _database;

  AdminRepository(this._database);

  Future<void> createAdminAccount({required ShopModel shop}) async {
    try {
      return await _database.setData(
        path: AdminDbPath.admin(shop.id),
        data: shop.toJson(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addShopProfileImage({required ShopModel shop}) async {
    try {
      await _database.setData(
        path: AdminDbPath.admin(shop.id),
        data: shop.toJson(),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ShopModel?> findAdminById(String id) async {
    log('User id $id');
    try {
      return await _database.getData(
        path: AdminDbPath.admin(id),
        builder: (json, _) => ShopModel.fromJson(json),
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
