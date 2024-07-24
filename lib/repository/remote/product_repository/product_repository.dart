import 'package:blitzz_shop/database/remote/firebase_database.dart';
import 'package:blitzz_shop/database/remote/firebase_storage.dart';
import 'package:blitzz_shop/feature/product/services/image_picker_notifier.dart';
import 'package:blitzz_shop/model/product/product_model.dart';
import 'package:blitzz_shop/repository/path/product_path/product_db_path.dart';
import 'package:blitzz_shop/repository/remote/auth_repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'product_repository.g.dart';

@riverpod
ProductRepository productRepository(ProductRepositoryRef ref) {
  final database = ref.watch(firebaseDatabaseProvider);
  return ProductRepository(database);
}

@riverpod
class AddProductNotifier extends _$AddProductNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> addNewProduct({
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String shopId,
  }) async {
    state = const AsyncLoading();
    final file = ref.read(imagePickerNotifierProvider);
    final imageUrl = await ref
        .read(firebaseStorageDbProvider)
        .uploadFile(path: ProductDbPath.products(), file: file!);
    final productProvider = ref.read(productRepositoryProvider);

    final String id = const Uuid().v4();

    final String createdBy = ref.read(authProvider).currentUser?.id ?? '';

    final ProductModel product = ProductModel(
      id: id,
      shopId: shopId,
      name: name,
      imageUrl: imageUrl,
      description: description,
      category: 'category',
      price: price,
      createdDate: DateTime.now(),
      quantity: quantity,
      createdBy: createdBy,
    );

    state = await AsyncValue.guard(
      () async => await productProvider.addNewProduct(product: product),
    );
  }
}

@riverpod
Stream<List<ProductModel>> products(ProductsRef ref) {
  return ref.watch(productRepositoryProvider).getAllProducts();
}

@riverpod
class ProductsStream extends _$ProductsStream {
  @override
  Stream<List<ProductModel>> build() =>
      ref.watch(productRepositoryProvider).getAllProducts();
}

@riverpod
class ShopProducts extends _$ShopProducts {
  @override
  Stream<List<ProductModel>> build(String shopId) =>
      ref.watch(productRepositoryProvider).findProductsByShop(shopId);
}

class ProductRepository {
  final FirebaseDatabase _database;

  ProductRepository(this._database);

  Future<void> addNewProduct({
    required ProductModel product,
  }) async {
    await _database.setData(
      path: ProductDbPath.product(product.id),
      data: product.toJson(),
    );
  }

  Stream<List<ProductModel>> getAllProducts() {
    return _database.collectionStream(
      path: ProductDbPath.products(),
      sort: (a, b) => a.createdDate.compareTo(b.createdDate),
      builder: (data, _) => ProductModel.fromJson(data),
    );
  }

  Stream<List<ProductModel>> findProductsByShop(String shopId) {
    final products = _database.collectionStream(
      path: ProductDbPath.products(),
      builder: (json, documentID) => ProductModel.fromJson(json),
    );

    return products.map(
      (products) {
        return products.where((e) => e.shopId == shopId).toList();
      },
    );
  }

  void editProduct() {
    _database.getData(
      path: 'path',
      builder: (data, documentID) {},
    );
  }

  void deleteProduct() {
    _database.getData(
      path: 'path',
      builder: (data, documentID) {},
    );
  }
}
