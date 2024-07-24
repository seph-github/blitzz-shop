// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseAuthHash() => r'7791bf70ce0f01bf991a53a76abc915478673c0b';

/// See also [firebaseAuth].
@ProviderFor(firebaseAuth)
final firebaseAuthProvider = AutoDisposeProvider<FirebaseAuth>.internal(
  firebaseAuth,
  name: r'firebaseAuthProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$firebaseAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FirebaseAuthRef = AutoDisposeProviderRef<FirebaseAuth>;
String _$authHash() => r'23104343fd7a2a5dce251a1b301bb7512822ad19';

/// See also [auth].
@ProviderFor(auth)
final authProvider = AutoDisposeProvider<AuthRepository>.internal(
  auth,
  name: r'authProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRef = AutoDisposeProviderRef<AuthRepository>;
String _$adminLoginHash() => r'24a40d7db8ffcffa9b593674b9aeb4f72531f06c';

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

/// See also [adminLogin].
@ProviderFor(adminLogin)
const adminLoginProvider = AdminLoginFamily();

/// See also [adminLogin].
class AdminLoginFamily extends Family<AsyncValue<UserCredential?>> {
  /// See also [adminLogin].
  const AdminLoginFamily();

  /// See also [adminLogin].
  AdminLoginProvider call(
    String email,
    String password,
  ) {
    return AdminLoginProvider(
      email,
      password,
    );
  }

  @override
  AdminLoginProvider getProviderOverride(
    covariant AdminLoginProvider provider,
  ) {
    return call(
      provider.email,
      provider.password,
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
  String? get name => r'adminLoginProvider';
}

/// See also [adminLogin].
class AdminLoginProvider extends AutoDisposeFutureProvider<UserCredential?> {
  /// See also [adminLogin].
  AdminLoginProvider(
    String email,
    String password,
  ) : this._internal(
          (ref) => adminLogin(
            ref as AdminLoginRef,
            email,
            password,
          ),
          from: adminLoginProvider,
          name: r'adminLoginProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$adminLoginHash,
          dependencies: AdminLoginFamily._dependencies,
          allTransitiveDependencies:
              AdminLoginFamily._allTransitiveDependencies,
          email: email,
          password: password,
        );

  AdminLoginProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
    required this.password,
  }) : super.internal();

  final String email;
  final String password;

  @override
  Override overrideWith(
    FutureOr<UserCredential?> Function(AdminLoginRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AdminLoginProvider._internal(
        (ref) => create(ref as AdminLoginRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
        password: password,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserCredential?> createElement() {
    return _AdminLoginProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminLoginProvider &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);
    hash = _SystemHash.combine(hash, password.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AdminLoginRef on AutoDisposeFutureProviderRef<UserCredential?> {
  /// The parameter `email` of this provider.
  String get email;

  /// The parameter `password` of this provider.
  String get password;
}

class _AdminLoginProviderElement
    extends AutoDisposeFutureProviderElement<UserCredential?>
    with AdminLoginRef {
  _AdminLoginProviderElement(super.provider);

  @override
  String get email => (origin as AdminLoginProvider).email;
  @override
  String get password => (origin as AdminLoginProvider).password;
}

String _$adminLoginNotifierHash() =>
    r'e3c698756553c068dc8ccae8c3ab18088886b60d';

/// See also [AdminLoginNotifier].
@ProviderFor(AdminLoginNotifier)
final adminLoginNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AdminLoginNotifier, UserCredential?>.internal(
  AdminLoginNotifier.new,
  name: r'adminLoginNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adminLoginNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdminLoginNotifier = AutoDisposeAsyncNotifier<UserCredential?>;
String _$adminSignupNotifierHash() =>
    r'3deceebe27aa7056728e5092473d9c662d53a45c';

/// See also [AdminSignupNotifier].
@ProviderFor(AdminSignupNotifier)
final adminSignupNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AdminSignupNotifier, Object?>.internal(
  AdminSignupNotifier.new,
  name: r'adminSignupNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adminSignupNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdminSignupNotifier = AutoDisposeAsyncNotifier<Object?>;
String _$adminLogoutNotifierHash() =>
    r'23d8a56ce3c061627e4d5eef7a182fe84cf4b732';

/// See also [AdminLogoutNotifier].
@ProviderFor(AdminLogoutNotifier)
final adminLogoutNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AdminLogoutNotifier, void>.internal(
  AdminLogoutNotifier.new,
  name: r'adminLogoutNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$adminLogoutNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AdminLogoutNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
