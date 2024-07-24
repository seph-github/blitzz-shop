enum BlitzzShopRoutes {
  products(routeName: 'Products', routePath: '/products'),
  addProduct(
      routeName: 'Add_product', routePath: 'add_product/shop_id=:shop_id'),

  productDetails(
      routeName: 'Product_details',
      routePath: 'product_details/product_id=:product_id'),
  signup(routeName: 'Sign_up', routePath: 'sign_up'),
  signupShopSetup(routeName: 'Shop_setup', routePath: '/shop_setup'),
  uploadShopProfile(
      routeName: 'Upload_shop_profile', routePath: '/upload_shop_profile'),
  dashboard(routeName: 'Dashboard', routePath: '/'),
  login(routeName: 'Login', routePath: '/login');

  const BlitzzShopRoutes({required this.routeName, required this.routePath});
  final String routeName;
  final String routePath;
}
