class UserDbPath {
  static String users() => 'users';
  static String user(String id) => '${users()}/$id';
}
