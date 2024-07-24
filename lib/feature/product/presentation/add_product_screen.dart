import 'package:blitzz_shop/feature/product/services/image_picker_notifier.dart';
import 'package:blitzz_shop/repository/remote/product_repository/product_repository.dart';
import 'package:blitzz_shop/widgets/custom_textfield.dart';
import 'package:blitzz_shop/widgets/loading_overlay.dart';
import 'package:blitzz_shop/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class AddProductScreen extends StatelessWidget {
  final String shopId;
  const AddProductScreen({this.shopId = '', super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final double btnWidth = size.height / 2 - (size.height * 0.2);
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productDescriptionController =
        TextEditingController();
    final TextEditingController productPriceController =
        TextEditingController();
    final TextEditingController productQuantityController =
        TextEditingController();

    return Consumer(builder: (context, ref, _) {
      return LoadingOverlay(
        isLoading: ref.watch(addProductNotifierProvider).isLoading,
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: (size.width * 0.4) / size.aspectRatio,
                      height: (size.height * 0.4) / size.aspectRatio,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Consumer(
                        builder: (context, ref, child) {
                          final image = ref.watch(imagePickerNotifierProvider);
                          return image != null
                              ? Image.file(
                                  image,
                                  fit: BoxFit.cover,
                                ).cornerRadiusWithClipRRect(8)
                              : const Icon(
                                  Icons.person,
                                  size: 150,
                                  color: Colors.amber,
                                );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Consumer(
                      builder: (context, ref, _) {
                        return MaterialButton(
                          onPressed: () async => ref
                              .read(imagePickerNotifierProvider.notifier)
                              .pickImage(),
                          child: const Text('Upload Image'),
                        );
                      },
                    ),
                  ],
                ),
                CustomTextfield(
                  hintText: 'Name',
                  controller: productNameController,
                ),
                CustomTextfield(
                  hintText: 'Description',
                  controller: productDescriptionController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextfield(
                      hintText: 'Price',
                      controller: productPriceController,
                      useMinimumWidth: true,
                      isNummbers: true,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    CustomTextfield(
                      hintText: 'Quantity',
                      controller: productQuantityController,
                      useMinimumWidth: true,
                      isNummbers: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Consumer(
                      builder: (context, ref, _) {
                        return PrimaryButton(
                          width: btnWidth,
                          label: 'Add',
                          onPressed: () async {
                            final String name =
                                productNameController.text.trim();
                            final String description =
                                productDescriptionController.text.trim();
                            final double price =
                                productPriceController.text.trim().toDouble();
                            final int quantity =
                                productQuantityController.text.trim().toInt();
                            ref
                                .read(addProductNotifierProvider.notifier)
                                .addNewProduct(
                                  name: name,
                                  description: description,
                                  price: price,
                                  quantity: quantity,
                                  shopId: shopId,
                                )
                                .then(
                                  (_) => context.pop(),
                                );
                          },
                        );
                      },
                    ),
                    PrimaryButton(
                      width: btnWidth,
                      label: 'Clear',
                      onPressed: () {},
                    ),
                  ],
                ),
                // const Spacer(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
