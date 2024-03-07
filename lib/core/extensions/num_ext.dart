extension NullIfNeg on num {
  num? get nullIfNeg => isNegative ? null : this;
}
