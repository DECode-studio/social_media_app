import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:social_media_app/core/models/user_model.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final box = GetStorage();

  // Token
  void saveToken(String token) => box.write('jwt_token', token);
  String? getToken() => box.read('jwt_token');
  void removeToken() => box.remove('jwt_token');

  // Users (database lokal)
  List<User> getAllUsers() {
    final users = box.read<List<dynamic>>('users') ?? [];
    return users.map((u) => User.fromJson(u)).toList();
  }

  void saveUser(User user) {
    final users = getAllUsers();
    users.add(user);
    box.write('users', users.map((u) => u.toJson()).toList());
  }

  User? findUserByEmail(String email) {
    return getAllUsers().firstWhereOrNull((u) => u.email == email);
  }

  // Current User
  void setCurrentUser(User user) => box.write('current_user', user.toJson());
  User? getCurrentUser() {
    final data = box.read('current_user');
    return data != null ? User.fromJson(data) : null;
  }

  bool isLoggedIn() => getToken() != null;

  void logout() {
    removeToken();
    box.remove('current_user');
  }
}