import 'package:cli_menu/cli_menu.dart';

enum Ops {
  reportWages,
  calculatePaycheck,
}

class Operation {
  final Ops _operation;

  Ops get op => _operation;

  const Operation(this._operation);

  static Ops get reportWages => Ops.reportWages;

  static Ops get calculatePaycheck => Ops.calculatePaycheck;

  static List<Operation> get values =>
      Ops.values.map((e) => Operation(e)).toList();

  @override
  String toString() {
    switch (_operation) {
      case Ops.calculatePaycheck:
        return 'Calculate Paycheck';
      case Ops.reportWages:
        return 'Report Wages';
    }
  }
}

class MainMenu {
  late final Menu _menu;

  MainMenu() {
    _menu = Menu(Operation.values);
  }

  Ops show() {
    print('What would you like to do today?');
    return _menu.choose().value.op;
  }
}
