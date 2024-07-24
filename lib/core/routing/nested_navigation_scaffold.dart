import 'package:blitzz_shop/model/shop/shop_model.dart';
import 'package:blitzz_shop/repository/remote/admin/admin_repository.dart';
import 'package:blitzz_shop/repository/remote/auth_repository/auth_repository.dart';
import 'package:blitzz_shop/utils/app_string.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

class NestedNavigationScaffold extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const NestedNavigationScaffold({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ShopModel? shop = ref.watch(adminNotifierProvider).value;

    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      key: scaffoldKey,
      body: Row(
        children: [
          BlitzzNavigationWidget(
            size: size,
            navigationShell: navigationShell,
            shop: shop,
          ),
          Flexible(
            child: Column(
              children: [
                AppBar(
                  title: Text(shop?.shopName ?? ''),
                ),
                Expanded(child: navigationShell),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BlitzzNavigationWidget extends StatelessWidget {
  final Size size;
  final StatefulNavigationShell navigationShell;
  final ShopModel? shop;

  const BlitzzNavigationWidget({
    super.key,
    required this.size,
    required this.navigationShell,
    this.shop,
  });

  @override
  Widget build(BuildContext context) {
    final double navigationRailWidth = size.height * 0.3;

    void goBranch(int index) {
      navigationShell.goBranch(
        index,
        initialLocation: index == navigationShell.currentIndex,
      );
    }

    return SizedBox(
      width: navigationRailWidth,
      child: Stack(
        children: [
          NavigationRail(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: goBranch,
            elevation: 2,
            backgroundColor: Colors.grey.shade200,
            leading: Container(
              height: size.height * 0.25,
              width: double.infinity,
              color: Colors.amber,
              child: Center(
                child: Container(
                  height: size.height * 0.2,
                  width: size.height * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    image: shop?.shopProfile != null
                        ? DecorationImage(
                            image: NetworkImage(shop!.shopProfile),
                            fit: BoxFit.cover,
                          )
                        : null,
                  ),
                ),
              ),
            ),
            extended: true,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.production_quantity_limits),
                label: Text('Products'),
              ),
            ],
          ),
          Positioned(
            bottom: 10.0,
            left: 0.0,
            width: navigationRailWidth,
            child: Consumer(
              builder: (context, ref, child) => ListTile(
                leading: const Icon(Icons.exit_to_app_rounded),
                onTap: () async => await ref
                    .read(adminLogoutNotifierProvider.notifier)
                    .adminLogout(),
                title: const Text(logoutBtn),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
