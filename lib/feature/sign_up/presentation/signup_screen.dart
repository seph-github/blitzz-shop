import 'package:blitzz_shop/feature/sign_up/services/validator_services.dart';
import 'package:blitzz_shop/repository/remote/auth_repository/auth_repository.dart';
import 'package:blitzz_shop/utils/app_string.dart';
import 'package:blitzz_shop/widgets/email_textfield.dart';
import 'package:blitzz_shop/widgets/loading_overlay.dart';
import 'package:blitzz_shop/widgets/password_textfield.dart';
import 'package:blitzz_shop/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmPasswordController =
        TextEditingController();

    final Size size = MediaQuery.sizeOf(context);

    final ScrollController scrollController = ScrollController();

    return Consumer(
      builder: (context, ref, _) {
        return LoadingOverlay(
          isLoading: ref.watch(adminSignupNotifierProvider).isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Blitzz Shop'),
              centerTitle: true,
            ),
            body: Form(
              autovalidateMode: AutovalidateMode.disabled,
              key: formKey,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SizedBox(
                      width: size.height * 0.8,
                      height: size.height * 0.85,
                      child: Column(
                        children: <Widget>[
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
                            height: 20,
                          ),
                          Column(
                            children: [
                              EmailTextfield(
                                controller: emailController,
                                validator: ValidatorServices.emailValidator,
                              ),
                              PasswordTextfield(
                                controller: passwordController,
                                text: password,
                                validator: ValidatorServices.passwordValidator,
                              ),
                              PasswordTextfield(
                                text: confirmPassword,
                                controller: confirmPasswordController,
                                validator: (value) =>
                                    ValidatorServices.confirmPasswordValidator(
                                  value,
                                  otherValue: passwordController.text.trim(),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Consumer(
                            builder: (context, ref, _) {
                              return PrimaryButton(
                                onPressed: () async {
                                  final bool isValid =
                                      formKey.currentState!.validate();

                                  if (isValid) {
                                    await ref
                                        .read(adminSignupNotifierProvider
                                            .notifier)
                                        .adminSignUp(
                                          email: emailController.text.trim(),
                                          password: confirmPasswordController
                                              .text
                                              .trim(),
                                        );
                                  }
                                },
                                label: registerBtn,
                              );
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // void _showRequiredShopImagePopUp(BuildContext context) async {
  //   Fluttertoast.showToast(
  //     msg: 'Shop Photo is required',
  //   );
  //   /* return await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return const AlertDialog(
  //         title: Text('Shop Image'),
  //         content: Text('Shop image is required'),
  //       );
  //     },
  //   ); */
  // }

  // Future _showError(
  //   BuildContext context,
  //   Object? error,
  // ) async {
  //   return await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text('Error Warnings'),
  //         content: Text('$error'),
  //       );
  //     },
  //   );
  // }
}
