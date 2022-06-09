import 'package:path_case/views/char_detail/char_detail_view.dart';

import '../../views/char_detail/char_detail_model.dart';
import '../../views/home/home_model.dart';
import '../../views/home/home_view.dart';
import '../../../app/app_shelf.dart';

String initialRoute = '/';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeView());
      case '/details':
        return MaterialPageRoute(builder: (_) => CharDetailView(selectedChar: arguments as Results));

      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('No route for ${settings.name}'))));
    }
  }
}
