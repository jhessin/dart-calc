import 'dart:io';

double readDouble(String prompt) {
  String? input;
  while (true) {
    // prompt for the name of the month
    input = readString(prompt);
    double? month = double.tryParse(input);
    if (month == null) {
      print('Please enter an integer');
      continue;
    }
    return month;
  }
}

int readInt(String prompt) {
  String? input;
  while (true) {
    // prompt for the name of the month
    input = readString(prompt);
    int? month = int.tryParse(input);
    if (month == null) {
      print('Please enter an integer');
      continue;
    }
    return month;
  }
}

String readString(String prompt) {
  String? input;
  while (true) {
    // prompt for the name of the month
    print(prompt);
    input = stdin.readLineSync();
    if (input == null) {
      print('Invalid input');
      continue;
    }
    return input;
  }
}
