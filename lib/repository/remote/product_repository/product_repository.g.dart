// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productRepositoryHash() => r'd86504425a575b2125bf4b9be8590996d3f10470';

/// See also [productRepository].
@ProviderFor(productRepository)
final productRepositoryProvider =
    AutoDisposeProvider<ProductRepository>.internal(
  productRepository,
  name: r'productRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductRepositoryRef = AutoDisposeProviderRef<ProductRepository>;
String _$productsHash() => r'b09957049f187fdcb8e1473c9ff653c57609f11e';

/// See also [products].
@ProviderFor(products)
final productsProvider = AutoDisposeStreamProvider<List<ProductModel>>.internal(
  products,
  name: r'productsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$productsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProductsRef = AutoDisposeStreamProviderRef<List<ProductModel>>;
String _$addProductNotifierHash() =>
    r'0ffe43ff66f0cce1c608e71a5767fc07280491b7';

/// See also [AddProductNotifier].
@ProviderFor(AddProductNotifier)
final addProductNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AddProductNotifier, void>.internal(
  AddProductNotifier.new,
  name: r'addProductNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addProductNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddProductNotifier = AutoDisposeAsyncNotifier<void>;
String _$productsStreamHash() => r'a19714965baee4a1cd7c9d6c1839758c09d3e89e';

/// See also [ProductsStream].
@ProviderFor(ProductsStream)
final productsStreamProvider = AutoDisposeStreamNotifierProvider<ProductsStream,
    List<ProductModel>>.internal(
  ProductsStream.new,
  name: r'productsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductsStream = AutoDisposeStreamNotifier<List<ProductModel>>;
String _$shopProductsHash() => r'48bcfc6d80ba83c93874db2f39588cb48bc2aeb5';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ShopProducts
    extends BuildlessAutoDisposeStreamNotifier<List<ProductModel>> {
  late final String shopId;

  Stream<List<ProductModel>> build(
    String shopId,
  );
}

/// See also [ShopProducts].
@ProviderFor(ShopProducts)
const shopProductsProvider = ShopProductsFamily();

/// See also [ShopProducts].
class ShopProductsFamily extends Family<AsyncValue<List<ProductModel>>> {
  /// See also [ShopProducts].
  const ShopProductsFamily();

  /// See also [ShopProducts].
  ShopProductsProvider call(
    String shopId,
  ) {
    return ShopProductsProvider(
      shopId,
    );
  }

  @override
  ShopProductsProvider getProviderOverride(
    covariant ShopProductsProvider provider,
  ) {
    return call(
      provider.shopId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'shopProductsProvider';
}

/// See also [ShopProducts].
class ShopProductsProvider extends AutoDisposeStreamNotifierProviderImpl<
    ShopProducts, List<ProductModel>> {
  /// See also [ShopProducts].
  ShopProductsProvider(
    String shopId,
  ) : this._internal(
          () => ShopProducts()..shopId = shopId,
          from: shopProductsProvider,
          name: r'shopProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$shopProductsHash,
          dependencies: ShopProductsFamily._dependencies,
          allTransitiveDependencies:
              ShopProductsFamily._allTransitiveDependencies,
          shopId: shopId,
        );

  ShopProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.shopId,
  }) : super.internal();

  final String shopId;

  @override
  Stream<List<ProductModel>> runNotifierBuild(
    covariant ShopProducts notifier,
  ) {
    return notifier.build(
      shopId,
    );
  }

  @override
  Override overrideWith(ShopProducts Function() create) {
    return ProviderOverride(
      origin: this,
      override: ShopProductsProvider._internal(
        () => create()..shopId = shopId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        shopId: shopId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<ShopProducts, List<ProductModel>>
      createElement() {
    return _ShopProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ShopProductsProvider && other.shopId == shopId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, shopId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ShopProductsRef
    on AutoDisposeStreamNotifierProviderRef<List<ProductModel>> {
  /// The parameter `shopId` of this provider.
  String get shopId;
}

class _ShopProductsProviderElement
    extends AutoDisposeStreamNotifierProviderElement<ShopProducts,
        List<ProductModel>> with ShopProductsRef {
  _ShopProductsProviderElement(super.provider);

  @override
  String get shopId => (origin as ShopProductsProvider).shopId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
