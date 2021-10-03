import 'calculate_paycheck/main.dart' as calculate_paycheck;
import 'menu.dart';
import 'report_wages/main.dart' as report_wages;

main() {
  final menu = MainMenu();
  final result = menu.show();
  switch (result) {
    case Ops.reportWages:
      return report_wages.main();
    case Ops.calculatePaycheck:
      return calculate_paycheck.main();
  }
}
