import 'package:cli_menu/cli_menu.dart';

class UserMenu {
  final List<String> names;
  late Menu<String> _menu;

  UserMenu(this.names) {
    _menu = Menu(names + ['.done']);
  }

  String get nextName {
    print('Who would you like to enter income for?');
    return _menu.choose().value;
  }
}
