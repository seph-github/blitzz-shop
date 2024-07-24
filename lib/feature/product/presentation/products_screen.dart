import 'package:blitzz_shop/core/enum/blitzz_shop_routes.dart';
import 'package:blitzz_shop/model/product/product_model.dart';
import 'package:blitzz_shop/model/shop/shop_model.dart';
import 'package:blitzz_shop/repository/remote/admin/admin_repository.dart';
import 'package:blitzz_shop/repository/remote/product_repository/product_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      floatingActionButton: Consumer(
        builder: (context, ref, _) {
          final ShopModel? shop = ref.watch(adminNotifierProvider).value;
          return FloatingActionButton(
            onPressed: () => context.pushNamed(
              BlitzzShopRoutes.addProduct.routeName,
              pathParameters: {'shop_id': shop?.id ?? ''},
            ),
            child: const Icon(Icons.add),
          );
        },
      ),
      body: Consumer(builder: (context, ref, _) {
        final List<ProductModel>? products = ref.watch(productsProvider).value;
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 9 / 14,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          itemCount: products?.length ?? 0,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context.goNamed(
                  BlitzzShopRoutes.productDetails.routeName,
                  extra: products?[index],
                  pathParameters: {
                    'product_id': products?[index].id ?? '',
                  },
                );
              },
              child: Card(
                clipBehavior: Clip.hardEdge,
                elevation: 0.5,
                child: Column(
                  children: [
                    CachedNetworkImage(
                        imageUrl: products?[index].imageUrl ?? ''),
                    Text(products?[index].name ?? ''),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
