import 'dart:io';
import 'model/bank.dart';
import 'model/user.dart';

main() {
  String? operationDefine;
  String? getOperationValue;
  double? setOperationValue;
  double? storageBalance = 0;

  do {
    print('Your Name: ');
    String? setUserName = stdin.readLineSync();

    print('Your Cpf: ');
    String? setUserCpf = stdin.readLineSync();

    print('Value:');
    getOperationValue = stdin.readLineSync();
    setOperationValue = double.parse(getOperationValue!);

    print('deposit / withdraw / balance / exit');

    print('Select Operation: ');
    String? operationDefine = stdin.readLineSync();

    var bankOperation = Bank(
      user: User(
        userName: setUserName,
        cpf: setUserCpf,
      ),
      valueParam: setOperationValue,
      typeOperation: operationDefine,
      setBalance: storageBalance,
    );

    if (operationDefine == 'deposit') {
      bankOperation.deposit(setOperationValue);
    }

    if (operationDefine == 'withdraw') {
      bankOperation.withDraw(setOperationValue);
    }

    print('');
    print(
        "---------------------------------------------------------------------");
    print(
        "Welcome ${bankOperation.user?.userName} - cpf: ${bankOperation.user?.cpf}");
    print("----------------------------");
    print("Balance: ${bankOperation.balance}");
    print("Value: ${bankOperation.valueParam}");
    print("Value: ${bankOperation.typeOperation}");
    print(
        "---------------------------------------------------------------------");

    storageBalance = bankOperation.balance; //save balance

  } while (operationDefine != 'exit');
}
