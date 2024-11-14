import 'package:flutter/foundation.dart';

class HomeUseCase extends ChangeNotifier {
  String dropdownValue = 'BTC/USDT';

  final dropDownList = ['BTC/USDT', 'BNB/USDT', 'ETH/USDT'];

  void selectNewDropdownValue(String value) {
    dropdownValue = value;
    notifyListeners();
  }
}
