class Test {
  double? _balance = 0;
  double? valueOperation;
  Test({
    this.valueOperation,
  });

  double? get balance => _balance = valueOperation;
}

main() {
  var bank = Test(valueOperation: 12);
  print("balance ${bank.balance}");
}
