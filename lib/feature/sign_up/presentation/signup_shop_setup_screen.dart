import 'package:blitzz_shop/core/enum/blitzz_shop_routes.dart';
import 'package:blitzz_shop/feature/sign_up/services/selected_country_services.dart';
import 'package:blitzz_shop/feature/sign_up/services/validator_services.dart';
import 'package:blitzz_shop/feature/sign_up/widgets/address_dropdown.dart';
import 'package:blitzz_shop/repository/api/address_search.dart';
import 'package:blitzz_shop/repository/remote/admin/admin_repository.dart';
import 'package:blitzz_shop/utils/app_string.dart';
import 'package:blitzz_shop/utils/country_code.dart';
import 'package:blitzz_shop/widgets/custom_textfield.dart';
import 'package:blitzz_shop/widgets/loading_overlay.dart';
import 'package:blitzz_shop/widgets/primary_button.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nb_utils/nb_utils.dart';

class SignupShopSetupScreen extends StatelessWidget {
  const SignupShopSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> shopFormKey = GlobalKey<FormState>();

    final Size size = MediaQuery.sizeOf(context);
    final ScrollController scrollController = ScrollController();

    final TextEditingController shopNameController = TextEditingController();
    final TextEditingController ownersNameController = TextEditingController();
    final SingleValueDropDownController phoneCodeController =
        SingleValueDropDownController();
    final TextEditingController phoneNumberController = TextEditingController();
    final SingleValueDropDownController countryController =
        SingleValueDropDownController();
    final SingleValueDropDownController stateController =
        SingleValueDropDownController();
    final SingleValueDropDownController cityController =
        SingleValueDropDownController();
    final TextEditingController streetController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();

    return Consumer(
      builder: (context, ref, _) {
        return LoadingOverlay(
          isLoading: ref.read(createAdminAccountProvider).isLoading,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Setup Shop Information'),
              centerTitle: true,
            ),
            body: Form(
              key: shopFormKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Center(
                  child: Card(
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    child: SizedBox(
                      width: size.height * 0.8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [
                            CustomTextfield(
                              hintText: shopName,
                              controller: shopNameController,
                              validator: ValidatorServices.shopNameValidator,
                            ),
                            CustomTextfield(
                              hintText: ownersName,
                              controller: ownersNameController,
                              validator:
                                  ValidatorServices.requiredFieldValidator,
                            ),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width / 2 - 48,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AddressDropdown(
                                    minWidth: 110,
                                    hintText: phoneCode,
                                    child: DropDownTextField(
                                      controller: phoneCodeController,
                                      validator: ValidatorServices
                                          .shortRequiredFieldValidator,
                                      clearOption: false,
                                      textFieldDecoration: InputDecoration(
                                        hintText: '+0',
                                        isDense: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      dropDownList: countryPhoneCodes
                                          .map(
                                            (code) => DropDownValueModel(
                                                name: code.dialCode,
                                                value: code.code),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  CustomTextfield(
                                    hintText: phoneNumber,
                                    controller: phoneNumberController,
                                    validator: ValidatorServices
                                        .requiredFieldValidator,
                                    isNummbers: true,
                                    minWidth: 340,
                                  ),
                                ],
                              ),
                            ),
                            AddressDropdown(
                              hintText: countryHintText,
                              child: Consumer(
                                builder: (context, ref, child) =>
                                    DropDownTextField(
                                  controller: countryController,
                                  validator:
                                      ValidatorServices.requiredFieldValidator,
                                  clearOption: false,
                                  dropDownList: ref
                                      .watch(countriesProvider)
                                      .when(
                                        data: (data) => data
                                            .map(
                                              (country) => DropDownValueModel(
                                                  name: country.name,
                                                  value: country.isoCode),
                                            )
                                            .toList(),
                                        error: (error, stackTrace) => [
                                          DropDownValueModel(
                                              name: error.toString(),
                                              value: stackTrace),
                                        ],
                                        loading: () => [],
                                      ),
                                  textFieldDecoration: InputDecoration(
                                    hintText: countryHintText,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onChanged: (val) {
                                    final DropDownValueModel newValue = val;

                                    final String isoCode = newValue.value ?? '';
                                    ref
                                        .read(selectedCountryIsoCodeProvider
                                            .notifier)
                                        .onCountryIsoCode(isoCode);
                                  },
                                ),
                              ),
                            ),
                            AddressDropdown(
                              hintText: stateHintText,
                              child: Consumer(
                                builder: (context, ref, child) =>
                                    DropDownTextField(
                                  controller: stateController,
                                  validator:
                                      ValidatorServices.requiredFieldValidator,
                                  clearOption: false,
                                  dropDownList: ref
                                      .watch(listStatesProvider)
                                      .when(
                                        data: (data) {
                                          return data
                                              .map(
                                                (state) => DropDownValueModel(
                                                    name: state.name,
                                                    value: state.isoCode),
                                              )
                                              .toList();
                                        },
                                        error: (error, stackTrace) => [
                                          DropDownValueModel(
                                              name: error.toString(),
                                              value: stackTrace),
                                        ],
                                        loading: () => [],
                                      ),
                                  textFieldDecoration: InputDecoration(
                                    hintText: stateHintText,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onChanged: (val) {
                                    final newValue = val;
                                    if (newValue != null) {
                                      final String isoCode =
                                          newValue.value ?? '';

                                      ref
                                          .read(selectedStateIsoCodeProvider
                                              .notifier)
                                          .onStateIsoCode(isoCode);
                                    }
                                  },
                                ),
                              ),
                            ),
                            AddressDropdown(
                              hintText: cityHintText,
                              child: Consumer(
                                builder: (context, ref, child) =>
                                    DropDownTextField(
                                  controller: cityController,
                                  validator:
                                      ValidatorServices.requiredFieldValidator,
                                  clearOption: false,
                                  dropDownList: ref
                                      .watch(listCitiesProvider)
                                      .when(
                                        data: (data) {
                                          return data
                                              .map(
                                                (city) => DropDownValueModel(
                                                    name: city.name,
                                                    value: city.countryCode),
                                              )
                                              .toList();
                                        },
                                        error: (error, stackTrace) => [
                                          DropDownValueModel(
                                              name: error.toString(),
                                              value: stackTrace),
                                        ],
                                        loading: () => [],
                                      ),
                                  textFieldDecoration: InputDecoration(
                                    hintText: cityHintText,
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                            CustomTextfield(
                              hintText: streetHintText,
                              controller: streetController,
                              validator:
                                  ValidatorServices.requiredFieldValidator,
                            ),
                            CustomTextfield(
                              hintText: zipCodeHintText,
                              controller: zipCodeController,
                              validator:
                                  ValidatorServices.requiredFieldValidator,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Consumer(
                              builder: (context, ref, _) {
                                return PrimaryButton(
                                  onPressed: () async {
                                    final bool isValid =
                                        shopFormKey.currentState!.validate();

                                    if (isValid) {
                                      await ref
                                          .watch(createAdminAccountProvider
                                              .notifier)
                                          .createAdminAccount(
                                            shopName: shopNameController.text
                                                .capitalizeEachWord()
                                                .trim(),
                                            country: countryController
                                                    .dropDownValue?.name ??
                                                '',
                                            addressState: stateController
                                                    .dropDownValue?.name ??
                                                '',
                                            city: cityController
                                                    .dropDownValue?.name ??
                                                '',
                                            street1: streetController.text
                                                .capitalizeEachWord()
                                                .trim(),
                                            zipcode: zipCodeController.text
                                                .capitalizeEachWord()
                                                .trim(),
                                            phoneNumber:
                                                '${phoneCodeController.dropDownValue?.name ?? ''} ${phoneNumberController.text.trim()}',
                                            ownersName: ownersNameController
                                                .text
                                                .capitalizeEachWord()
                                                .trim(),
                                          )
                                          .then((_) => context.goNamed(
                                              BlitzzShopRoutes.uploadShopProfile
                                                  .routeName));
                                    }
                                  },
                                  label: nextBtn,
                                );
                              },
                            ),
                          ],
                        ),
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
}
