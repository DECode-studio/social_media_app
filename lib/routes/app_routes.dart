import 'package:get/get.dart';
import 'package:social_media_app/features/auth/view/login_screen.dart';
import 'package:social_media_app/features/auth/view/register_screen.dart';
import 'package:social_media_app/features/home/views/main_screen.dart';

class AppRoutes {
  static const String LOGIN = '/login';
  static const String REGISTER = '/register';
  static const String HOME = '/home';

  static final routes = [
    GetPage(
      name: LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: REGISTER,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: HOME,
      page: () => MainScreen(),
    ),
  ];
}
