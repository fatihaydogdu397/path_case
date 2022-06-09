import '../../app_shelf.dart';

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => Color(0xFFE11C22);
  Color get lightTextColor => Color(0xFFF3F3F3);
  Color get darkTextColor => Color.fromARGB(255, 0, 0, 0);
  Color get borderColor => Color.fromARGB(255, 85, 0, 0);
}
