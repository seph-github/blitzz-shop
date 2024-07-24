import 'package:blitzz_shop/core/enum/blitzz_shop_routes.dart';
import 'package:blitzz_shop/feature/sign_up/services/validator_services.dart';
import 'package:blitzz_shop/repository/remote/auth_repository/auth_repository.dart';
import 'package:blitzz_shop/utils/app_string.dart';
import 'package:blitzz_shop/widgets/email_textfield.dart';
import 'package:blitzz_shop/widgets/loading_overlay.dart';
import 'package:blitzz_shop/widgets/password_textfield.dart';
import 'package:blitzz_shop/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.sizeOf(context);

    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return LoadingOverlay(
      isLoading: ref.watch(adminLoginNotifierProvider).isLoading,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SizedBox(
                    width: size.height * 0.8,
                    height: size.height * 0.8,
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Image.asset(
                          height: 150,
                          width: 150,
                          'assets/images/blitzz-logo.png',
                          alignment: Alignment.center,
                          fit: BoxFit.cover,
                        ).cornerRadiusWithClipRRect(80).center(),
                        const SizedBox(
                          height: 40,
                        ),
                        EmailTextfield(
                          controller: emailController,
                          validator: ValidatorServices.emailValidator,
                        ),
                        PasswordTextfield(
                          controller: passwordController,
                          text: password,
                          validator: ValidatorServices.passwordValidator,
                        ),
                        const Spacer(),
                        PrimaryButton(
                          onPressed: () async {
                            await ref
                                .read(adminLoginNotifierProvider.notifier)
                                .adminLogin(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                          },
                          label: loginBtn,
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () => context
                              .goNamed(BlitzzShopRoutes.signup.routeName),
                          child: const Text('Be our partner, register here'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
