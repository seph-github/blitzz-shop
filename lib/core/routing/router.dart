// import 'dart:developer';

import 'dart:developer';

import 'package:blitzz_shop/core/routing/nested_navigation_scaffold.dart';
import 'package:blitzz_shop/core/enum/blitzz_shop_routes.dart';
import 'package:blitzz_shop/core/routing/go_router_refreshable_listener.dart';
import 'package:blitzz_shop/database/remote/firebase_database.dart';
import 'package:blitzz_shop/feature/dashboard/dashboard_screen.dart';
import 'package:blitzz_shop/feature/login/login_screen.dart';
import 'package:blitzz_shop/feature/product/presentation/add_product_screen.dart';
import 'package:blitzz_shop/feature/product/presentation/product_details_screen.dart';
import 'package:blitzz_shop/feature/product/presentation/products_screen.dart';
import 'package:blitzz_shop/feature/sign_up/presentation/signup_screen.dart';
import 'package:blitzz_shop/feature/sign_up/presentation/signup_shop_setup_screen.dart';
import 'package:blitzz_shop/feature/sign_up/presentation/signup_upload_shop_profile_screen.dart';
import 'package:blitzz_shop/model/product/product_model.dart';
import 'package:blitzz_shop/repository/path/admin_path/admin_db_path.dart';
import 'package:blitzz_shop/repository/remote/admin/admin_repository.dart';
import 'package:blitzz_shop/repository/remote/auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final rootNavigationKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> dashboardNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> productNavigatorKey =
    GlobalKey<NavigatorState>();

@riverpod
GoRouter router(RouterRef ref) {
  final AuthRepository auth = ref.watch(authProvider);
  return GoRouter(
    navigatorKey: rootNavigationKey,
    initialLocation: BlitzzShopRoutes.login.routePath,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(auth.authStateChanges()),
    redirect: (context, state) async {
      // log('called redirect');
      final user = auth.loggedUser;

      final hasUser = user != null;
      final userExist = user?.uid != null
          ? await ref.watch(firebaseDatabaseProvider).docExists(
                path: AdminDbPath.admin(user?.uid ?? ''),
              )
          : false;

      final path = state.uri.path;
      // log('Route path: $path');
      final isLogin = path.contains(BlitzzShopRoutes.login.routePath);
      // log('Is path login: $isLogin');
      final isSignup = path.contains(BlitzzShopRoutes.signup.routePath);
      // log('is path sign up? $isSignup');

      if (!hasUser) return isLogin ? null : BlitzzShopRoutes.login.routePath;

      if (isLogin || isSignup) {
        // log('in isLogin if condition');
        if (!userExist) {
          // log('in no userExisit if condition');
          return BlitzzShopRoutes.signupShopSetup.routePath;
        } else {
          // log('in has userExisit else condition');
          final adminUser =
              await ref.watch(adminRepositoryProvider).findAdminById(user.uid);
          if (adminUser?.shopProfile == '' || adminUser?.shopProfile == null) {
            // log('admin shop no image if condtion');
            return BlitzzShopRoutes.uploadShopProfile.routePath;
          }
        }
        // log('must redirect to dashboard');
        return BlitzzShopRoutes.dashboard.routePath;
      }
      // log('return null');
      return null;
    },
    routes: [
      GoRoute(
        name: BlitzzShopRoutes.login.routeName,
        path: BlitzzShopRoutes.login.routePath,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: LoginScreen(),
          );
        },
        routes: [
          GoRoute(
            name: BlitzzShopRoutes.signup.routeName,
            path: BlitzzShopRoutes.signup.routePath,
            pageBuilder: (context, state) {
              return const NoTransitionPage(
                child: SignupScreen(),
              );
            },
          ),
        ],
      ),
      GoRoute(
        name: BlitzzShopRoutes.signupShopSetup.routeName,
        path: BlitzzShopRoutes.signupShopSetup.routePath,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: SignupShopSetupScreen(),
          );
        },
      ),
      GoRoute(
        name: BlitzzShopRoutes.uploadShopProfile.routeName,
        path: BlitzzShopRoutes.uploadShopProfile.routePath,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignupUploadProfileScreen(),
        ),
      ),
      StatefulShellRoute.indexedStack(
        pageBuilder: (context, state, navigationShell) {
          return NoTransitionPage(
            child: NestedNavigationScaffold(navigationShell: navigationShell),
          );
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: dashboardNavigatorKey,
            routes: [
              GoRoute(
                name: BlitzzShopRoutes.dashboard.routeName,
                path: BlitzzShopRoutes.dashboard.routePath,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: DashboardScreen(),
                  );
                },
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: productNavigatorKey,
            routes: [
              GoRoute(
                name: BlitzzShopRoutes.products.routeName,
                path: BlitzzShopRoutes.products.routePath,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: ProductsScreen(),
                  );
                },
                routes: [
                  GoRoute(
                    name: BlitzzShopRoutes.addProduct.routeName,
                    path: BlitzzShopRoutes.addProduct.routePath,
                    builder: (context, state) {
                      return AddProductScreen(
                        shopId: state.pathParameters['shop_id'] as String,
                      );
                    },
                  ),
                  GoRoute(
                    name: BlitzzShopRoutes.productDetails.routeName,
                    path: BlitzzShopRoutes.productDetails.routePath,
                    builder: (context, state) {
                      final product = state.extra as ProductModel;

                      return ProductDetailsScreen(
                        product: product,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
