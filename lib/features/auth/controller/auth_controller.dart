import 'package:get/get.dart';
import 'package:social_media_app/core/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService authService = AuthService();

  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void register(String name, String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final result = await authService.register(name, email, password);
      if (result['success']) {
        Get.offAllNamed('/home');
      } else {
        errorMessage.value = result['error'];
      }
    } catch (e) {
      errorMessage.value = 'Registration failed';
    } finally {
      isLoading.value = false;
    }
  }

  void login(String email, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      final result = await authService.login(email, password);
      if (result['success']) {
        Get.offAllNamed('/home');
      } else {
        errorMessage.value = result['error'];
      }
    } catch (e) {
      errorMessage.value = 'Login failed';
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    authService.logout();
    Get.offAllNamed('/login');
  }

  bool isLoggedIn() {
    return authService.isTokenValid();
  }
}
