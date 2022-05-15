import 'user.dart';

class Bank {
  User? user;
  double? setBalance = 0;
  double? _balance;
  double? valueParam;
  String? typeOperation;

  Bank({
    required this.user,
    this.valueParam = 0,
    this.typeOperation,
    this.setBalance,
  });

  double? get balance {
    return _balance;
  }

  void set balance(double? value) {
    switch (typeOperation) {
      case 'deposit':
        deposit(value!);
        break;
      case 'withdraw':
        withDraw(value!);
        break;
    }
  }

  void deposit(double value) {
    _balance = setBalance;

    if (_balance != null) {
      _balance = (_balance! + valueParam!);
    }
  }

  void withDraw(double value) {
    _balance = setBalance;

    if (_balance != null && _balance! > 0 && _balance! >= valueParam!) {
      _balance = (_balance! - valueParam!);
    } else {
      throw ('low balance');
    }
  }
}
