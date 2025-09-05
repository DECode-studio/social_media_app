class AuthResponse {
  final bool success;
  final String? message;
  final Map<String, dynamic>? data;

  AuthResponse({required this.success, this.message, this.data});

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      success: map['success'],
      message: map['message'],
      data: map['data'],
    );
  }
}
