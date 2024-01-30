import 'package:intl/intl.dart';

/// A utility class for formatting text.
class FormatText {
  /// Formats the given [value] as a currency in Vietnamese dong (đ).
  ///
  /// The [value] parameter represents the value to be formatted.
  /// Returns the formatted currency string.
  static current(double value) {
    final NumberFormat currency = NumberFormat('#,##0', 'vi_VN');
    return "${currency.format(value)}đ";
  }
}
