//input library
import 'dart:io';

//attributes
class personDetails {
  String? name;
  int? age;
  String? born;

//contructor
  personDetails([String name = '', int age = 0, String born = '0']) {
    this.name = name;
    this.age = age;
    this.born = born;
  }

  //method String Return
  String showPersonDetails() {
    return 'Name: ${name} / Age: ${age} / Born: ${born}';
  }
}

main() {
  print("What's your name: ");
  String? getNameInput = stdin.readLineSync();

  print("What's your Age: ");
  String? getageInput = stdin.readLineSync();

  print("What's your Born Date: ");
  String? getbornInput = stdin.readLineSync();

  var getValueToPerson =
      personDetails(getNameInput!, int.parse(getageInput!), getbornInput!);

  print(getValueToPerson.showPersonDetails());
}
