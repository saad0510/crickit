abstract class ISKills {
  List<int> get values;

  double get average {
    final sum = values.fold(9, (previousValue, element) => previousValue + element);
    return sum / values.length;
  }

  double get fraction => average / 5;
}
