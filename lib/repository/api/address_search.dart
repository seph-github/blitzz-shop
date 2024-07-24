import 'dart:async';

import 'package:blitzz_shop/feature/sign_up/services/selected_country_services.dart';
import 'package:country_state_city/country_state_city.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'address_search.g.dart';

@riverpod
Future<List<Country>> countries(CountriesRef ref) async {
  return await AddressSearch.getCountries();
}

@riverpod
Future<List<State>> listStates(ListStatesRef ref) async {
  final String? isoCode = ref.watch(selectedCountryIsoCodeProvider);

  return await AddressSearch.getStates(isoCode ?? '');
}

@riverpod
Future<List<City>> listCities(ListCitiesRef ref) async {
  final String? countryCode = ref.watch(selectedCountryIsoCodeProvider);
  final String? stateCode = ref.watch(selectedStateIsoCodeProvider);

  return await AddressSearch.getCities(
      stateCode: stateCode ?? '', countryCode: countryCode ?? '');
}

class AddressSearch {
  AddressSearch._();

  static Future<List<Country>> getCountries() async {
    final List<Country> results = await getAllCountries();

    return results;
  }

  static Future<List<State>> getStates(String countryCode) async {
    final List<State> states = await getStatesOfCountry(countryCode);

    return states;
  }

  static Future<List<City>> getCities({
    required String countryCode,
    required String stateCode,
  }) async {
    final cities = await getStateCities(countryCode, stateCode);

    return cities;
  }
}
