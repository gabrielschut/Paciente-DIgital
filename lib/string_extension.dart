extension StringExtension on String {

  bool isValidDouble() => double.tryParse(this) != null;

  bool isWhiteSpace() => this.trim().isEmpty;

  bool isValidInt() => int.tryParse(this) != null;
}