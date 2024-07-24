import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_country_services.g.dart';

@riverpod
class SelectedCountryIsoCode extends _$SelectedCountryIsoCode {
  @override
  String? build() => null;

  String? onCountryIsoCode(String? value) {
    log(value!);
    return state = value;
  }
}

@riverpod
class SelectedStateIsoCode extends _$SelectedStateIsoCode {
  @override
  String? build() => null;

  String? onStateIsoCode(String? value) {
    return state = value;
  }
}
