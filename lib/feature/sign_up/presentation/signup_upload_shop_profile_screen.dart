import 'package:blitzz_shop/core/enum/blitzz_shop_routes.dart';
import 'package:blitzz_shop/feature/product/services/image_picker_notifier.dart';
import 'package:blitzz_shop/repository/remote/admin/admin_repository.dart';
import 'package:blitzz_shop/widgets/loading_overlay.dart';
import 'package:blitzz_shop/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupUploadProfileScreen extends ConsumerWidget {
  const SignupUploadProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(imagePickerNotifierProvider);
    final Size size = MediaQuery.sizeOf(context);
    return LoadingOverlay(
      isLoading: ref.watch(addShopProfileImageProvider).isLoading,
      child: Scaffold(
        body: Center(
          child: Card(
            child: SizedBox(
              height: size.height * 0.8,
              width: size.height * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      image: file != null
                          ? DecorationImage(
                              image: FileImage(file),
                              fit: BoxFit.cover,
                            )
                          : null,
                    ),
                    height: size.height * 0.4,
                    width: size.height * 0.4,
                  ),
                  PrimaryButton(
                    label: 'Add Photo',
                    onPressed: () => ref
                        .read(imagePickerNotifierProvider.notifier)
                        .pickImage(),
                  ),
                  PrimaryButton(
                    label: 'Submit',
                    onPressed: file != null
                        ? () => ref
                            .read(addShopProfileImageProvider.notifier)
                            .addShopProfileImage(file)
                            .then(
                              (value) => context.goNamed(
                                  BlitzzShopRoutes.dashboard.routeName),
                            )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
