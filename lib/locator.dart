import 'package:get_it/get_it.dart';
import 'package:path_case/views/char_detail/char_detail_viewmodel.dart';
import 'views/home/home_viewmodel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeViewmodel());
  locator.registerLazySingleton(() => CharDetailViewmodel());
}
