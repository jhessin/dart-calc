class WageCalculator {
  final List<String> _names;
  final String _month;
  final Map<String, Map<int, double>> _wages;

  List<String> get names => _names;

  String get month => _month;

  WageCalculator({
    required List<String> names,
    required String month,
  })  : _names = names,
        _month = month,
        _wages = {};

  addWage(String name, int day, double value) {
    _wages[name] = _wages[name] ?? {};
    _wages[name]?[day] = (_wages[name]?[day] ?? 0) + value;
  }

  num? getTotalFor({
    required String name,
    double? day,
  }) {
    if (day != null) {
      return _wages[name]?[day];
    }
    var total = 0.0;
    var localWages = _wages[name];
    if (localWages != null) {
      for (var wage in localWages.values) {
        total += wage;
      }
      return total;
    }
    return 0;
  }

  String get totals {
    var result = <String, double>{};
    for (var name in _wages.keys) {
      var wage = _wages[name]!;
      for (var day in wage.keys) {
        var value = wage[day]!;
        result[name] = (result[name] ?? 0) + value;
      }
    }

    String strResult = '';
    for (var name in result.keys) {
      var wage = result[name]!;
      strResult += '$name earned a total of \$$wage in $_month\n';
    }
    return strResult;
  }

  @override
  String toString() {
    String result = '';
    for (var name in _wages.keys) {
      Map<int, double> dayMap = _wages[name]!;
      for (var day in dayMap.keys) {
        double amount = dayMap[day]!;
        result += '$name was paid \$$amount on $_month $day\n';
      }
    }
    return result;
  }
}
