import 'package:dart_calc/report_wages/user_menu.dart';
import 'package:dart_calc/report_wages/wage_calculator.dart';

import '../io.dart';

main() {
  List<String> users = [];
  final month = readString('What month are you reporting for?');

  // loop and prompt for the name of each user
  while (true) {
    final user = readString('Enter users (.done finishes)');
    if (user.trim() == '.done' && users.isNotEmpty) break;
    users += [user];
  }

  // create the calculator
  WageCalculator calculator = WageCalculator(names: users, month: month);

  // loop and present another menu to add paychecks.
  UserMenu menu = UserMenu(users);

  while (true) {
    var name = menu.nextName;
    if (name.trim() == '.done') break;

    var day = readInt('Enter the day of the pay');
    var amount = readDouble('How much was paid(+) or deducted(-)?');
    calculator.addWage(name, day, amount);

    print(calculator);
  }

  // print the final totals
  print('final totals:\n${calculator.totals}');
}
