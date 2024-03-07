import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/assets.dart';

final countriesProvider = FutureProvider.autoDispose<List<String>>(
  (ref) async {
    final jsonString = await rootBundle.loadString(AppData.countries);
    final jsonList = json.decode(jsonString) as List;
    final countries = List<String>.from(jsonList);
    return countries;
  },
);
