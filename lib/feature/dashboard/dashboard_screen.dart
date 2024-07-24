import 'package:blitzz_shop/model/shop/shop_model.dart';
import 'package:blitzz_shop/repository/remote/admin/admin_repository.dart';
import 'package:blitzz_shop/repository/remote/product_repository/product_repository.dart';
import 'package:blitzz_shop/widgets/loading_overlay.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ShopModel? shop = ref.watch(adminNotifierProvider).value;

    final shopProducts = ref.watch(
      shopProductsProvider.call(shop?.id ?? ''),
    );

    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          return shopProducts.when(
            data: (product) {
              if (product.isEmpty) {
                return const Center(
                  child: Text('No Products Found!'),
                );
              }
              return Wrap(
                children: product
                    .map(
                      (product) => CachedNetworkImage(
                        imageUrl: product.imageUrl,
                        imageBuilder: (context, imageProvider) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            clipBehavior: Clip.hardEdge,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            child: GridTile(
                              footer: Container(
                                clipBehavior: Clip.none,
                                padding: const EdgeInsets.all(8.0),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16.0),
                                    bottomRight: Radius.circular(16.0),
                                  ),
                                  border: Border(
                                    left: BorderSide(color: Colors.grey),
                                    right: BorderSide(color: Colors.grey),
                                    bottom: BorderSide(color: Colors.grey),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Name: ${product.name}'),
                                  ],
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        placeholder: (_, url) => Lottie.asset(
                          'assets/lottie_files/loading_spinner.json',
                          fit: BoxFit.scaleDown,
                        ),
                        width: (size.width * 0.5) / size.aspectRatio,
                        height: (size.height * 0.5) / size.aspectRatio,
                        fit: BoxFit.fitWidth,
                      ),
                    )
                    .toList(),
              );
            },
            error: (error, stackTrace) {
              return Center(
                child: Text('Error: $error, StackTrace: $stackTrace'),
              );
            },
            loading: () => LoadingOverlay(
              isLoading: ref.watch(productsProvider).isLoading,
              child: const Center(
                child: Text('No Products Found'),
              ),
            ),
          );
        },
      ),
    );
  }
}
