class ProductDbPath {
  static String products() => 'products';
  static String product(String id) => '${products()}/$id';
}
