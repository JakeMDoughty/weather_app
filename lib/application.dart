import 'package:weather_app/support/routing/routes.dart';
import 'package:fluro/fluro.dart';

class Application {
  static FluroRouter? router;

  static void setRouting() {
    router = FluroRouter();
    Routes.configureRoutes(router!);
    router = router;
  }
}
