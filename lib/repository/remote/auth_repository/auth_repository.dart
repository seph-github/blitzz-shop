import 'package:blitzz_shop/model/user/user_model.dart';
import 'package:blitzz_shop/repository/remote/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@riverpod
AuthRepository auth(AuthRef ref) {
  final auth = ref.watch(firebaseAuthProvider);
  final userRepository = ref.watch(userRepositoryProvider);
  return AuthRepository(auth, userRepository);
}

@riverpod
FutureOr<UserCredential?> adminLogin(
    AdminLoginRef ref, String email, String password) {
  return ref.watch(authProvider).adminLogin(email: email, password: password);
}

@riverpod
class AdminLoginNotifier extends _$AdminLoginNotifier {
  @override
  FutureOr<UserCredential?> build() => null;

  Future<void> adminLogin({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();
    final repository = ref.watch(authProvider);
    state = await AsyncValue.guard(
      () => repository.adminLogin(email: email, password: password),
    );
  }
}

@riverpod
class AdminSignupNotifier extends _$AdminSignupNotifier {
  @override
  FutureOr build() {}

  Future adminSignUp({required String email, required String password}) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(
      () =>
          ref.read(authProvider).adminSignUp(email: email, password: password),
    );
  }
}

@riverpod
class AdminLogoutNotifier extends _$AdminLogoutNotifier {
  @override
  FutureOr<void> build() async => await adminLogout();

  Future<void> adminLogout() async {
    state = const AsyncLoading();
    final auth = ref.read(authProvider);
    state = await AsyncValue.guard(
      () async => await auth.adminLogout(),
    );
  }
}

class AuthRepository {
  final FirebaseAuth _auth;
  final UserRepository userRepository;

  AuthRepository(this._auth, this.userRepository);

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  User? get loggedUser => _auth.currentUser;

  UserModel? _toUserModel(User? user) {
    return UserModel(id: user?.uid ?? '', email: user?.email ?? '');
  }

  UserModel? get currentUser => _toUserModel(_auth.currentUser);

  Future<UserCredential?> adminLogin({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return result;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      throw Exception(e);
    }
  }

  Future<UserCredential> adminSignUp(
      {required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> adminLogout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
