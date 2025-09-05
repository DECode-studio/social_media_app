import 'package:social_media_app/core/models/user_model.dart';
import 'package:social_media_app/core/services/storage_service.dart';
import 'package:social_media_app/core/utils/jwt_generator.dart';

class AuthService {
  final storage = StorageService();

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    if (storage.findUserByEmail(email) != null) {
      return {'success': false, 'error': 'Email already exists'};
    }

    final user = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      password: password,
    );

    storage.saveUser(user);
    final token = JwtGenerator.generateToken(user);
    storage.saveToken(token);
    storage.setCurrentUser(user);

    return {'success': true, 'user': user, 'token': token};
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    final user = storage.findUserByEmail(email);
    if (user == null) {
      return {'success': false, 'error': 'User not found'};
    }
    if (user.password != password) {
      return {'success': false, 'error': 'Invalid password'};
    }

    final token = JwtGenerator.generateToken(user);
    storage.saveToken(token);
    storage.setCurrentUser(user);

    return {'success': true, 'user': user, 'token': token};
  }

  void logout() {
    storage.logout();
  }

  bool isTokenValid() {
    final token = storage.getToken();
    if (token == null) return false;
    return !JwtGenerator.isTokenExpired(token);
  }
}
