import 'dart:io';

void main() {
  print("Qual a sua idade?");
  String? input = stdin.readLineSync();
  print("Sua idade é $input.");
}
