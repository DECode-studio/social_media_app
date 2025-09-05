class JwtToken {
  final String token;
  final DateTime issuedAt;
  final DateTime expiresAt;

  JwtToken({
    required this.token,
    required this.issuedAt,
    required this.expiresAt,
  });

  bool get isExpired {
    return DateTime.now().isAfter(expiresAt);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'issuedAt': issuedAt.toIso8601String(),
      'expiresAt': expiresAt.toIso8601String(),
    };
  }

  factory JwtToken.fromJson(Map<String, dynamic> json) {
    return JwtToken(
      token: json['token'],
      issuedAt: DateTime.parse(json['issuedAt']),
      expiresAt: DateTime.parse(json['expiresAt']),
    );
  }
}
