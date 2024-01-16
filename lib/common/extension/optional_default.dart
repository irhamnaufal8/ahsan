extension StringExtension on String? {
  String orEmpty() {
    return this ?? '';
  }
}

extension IntExtension on int? {
  int orZero() {
    return this ?? 0;
  }
}
