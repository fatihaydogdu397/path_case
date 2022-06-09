import '../../app_shelf.dart';

extension BorderRadiusExtension on BuildContext {
  BorderRadius get lowCircular => BorderRadius.circular(8);
  BorderRadius get mediumCircular => BorderRadius.circular(15);
  BorderRadius get medHighCircular => BorderRadius.circular(20);
  BorderRadius get highCircular => BorderRadius.circular(30);
  BorderRadius get extremeCircular => BorderRadius.circular(40);
}

extension BorderRadiusOnlyExtensionn on BuildContext {
  Radius get lowRadius => const Radius.circular(8);
  Radius get medRadius => const Radius.circular(15);
  Radius get medHighRadius => const Radius.circular(20);
  Radius get highRadius => const Radius.circular(30);
  Radius get extremeRadius => const Radius.circular(40);
}
