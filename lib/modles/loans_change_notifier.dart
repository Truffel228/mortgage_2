import 'dart:convert';

import 'package:mortgage/modles/mortgage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoansChangeNotifier extends ChangeNotifier {
  LoansChangeNotifier(this._shPref);

  final SharedPreferences _shPref;

  final List<Mortgage> loans = [];

  void addLoan(Mortgage loan) {
    loans.add(loan);
    notifyListeners();
    _cacheLoans();
  }

  void deleteLoan(Mortgage loan) {
    loans.remove(loan);
    notifyListeners();
    _cacheLoans();
  }

  void editLoan(Mortgage oldLoan, Mortgage edittedLoan) {
    final index = loans.indexOf(oldLoan);
    loans.removeAt(index);
    loans.insert(index, edittedLoan);
    notifyListeners();
    _cacheLoans();
  }

  void init() {
    final encodedJsons = _shPref.getString('cachedLoans');

    if (encodedJsons == null) return;

    final decodedJsons = jsonDecode(encodedJsons) as List<dynamic>;

    final cachedIncomes =
        decodedJsons.map((e) => Mortgage.fromJson(e)).toList();
    loans.addAll(cachedIncomes);
    notifyListeners();
  }

  void _cacheLoans() {
    final jsons = loans.map((e) => e.toJson()).toList();
    final encodedJsons = jsonEncode(jsons);
    _shPref.setString('cachedLoans', encodedJsons);
  }
}
