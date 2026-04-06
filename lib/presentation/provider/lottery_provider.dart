import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:loteryapp/core/contants/app_strings.dart';
import 'package:loteryapp/domain/entities/lottery_result.dart';


class LotteryProvider extends ChangeNotifier {
  final Random _random = Random();

  int? _selectedNumber;
  LotteryResult? _lotteryResult;
  String? _errorMessage;

  int? get getSelectedNumber => _selectedNumber;
  LotteryResult? get lotteryResult => _lotteryResult;
  String? get errorMessage => _errorMessage;

  bool isValidNumber(int? number) {
    return number! >= 1 && number <= 10;
  }
  void selectedNumber(int? number){
    _selectedNumber = number;
    _errorMessage = null;
    notifyListeners();
  }


  void playLottery() {
    _errorMessage = null;

    if (_selectedNumber == null) {
      _errorMessage = AppStrings.selectNumberError;
      notifyListeners();
      return;
    }

    if (!isValidNumber(_selectedNumber)) {
      _errorMessage = AppStrings.selectNumberError;
      notifyListeners();
      return;
    }

    final int winningNumber = _random.nextInt(10) + 1;

    final bool isWinner = _selectedNumber == winningNumber;

    _lotteryResult = LotteryResult(
      lotteryNumber: _selectedNumber!,
      winningNumber: winningNumber,
      isWinner: isWinner,
    );
    notifyListeners();
  }

  void resetLottery() {
    _selectedNumber = null;
    _lotteryResult = null;
    _errorMessage = null;
    notifyListeners();
  }
}
