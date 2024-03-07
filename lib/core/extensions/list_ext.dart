extension SafeLookupExt<T> on List<T> {
  T? find(bool Function(T x) finder) {
    try {
      return firstWhere(finder);
    } on StateError {
      return null;
    }
  }
}
