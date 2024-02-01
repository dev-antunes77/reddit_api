import 'package:uuid/uuid.dart';

abstract class AppUtils {
  static String generateRandomId() {
    const Uuid uuid = Uuid();
    return uuid.v4();
  }

  static String formatNumber(int number) {
    if (number >= 1000000000) {
      double result = number / 1000000000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}B';
    } else if (number >= 1000000) {
      double result = number / 1000000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}M';
    } else if (number >= 1000) {
      double result = number / 1000;
      return '${result.toStringAsFixed(result.truncateToDouble() == result ? 0 : 1)}K';
    } else {
      return number.toString();
    }
  }
}
