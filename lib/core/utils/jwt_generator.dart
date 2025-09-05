import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:social_media_app/core/models/user_model.dart';

class JwtGenerator {
  static const Map<String, dynamic> header = {'alg': 'HS256', 'typ': 'JWT'};

  static String generateToken(User user) {
    final now = DateTime.now();
    final expire = now.add(Duration(hours: 24));

    final payload = {
      'id': user.id,
      'email': user.email,
      'name': user.name,
      'iat': now.millisecondsSinceEpoch ~/ 1000,
      'exp': expire.millisecondsSinceEpoch ~/ 1000,
    };

    final headerStr = base64Url.encode(utf8.encode(json.encode(header)));
    final payloadStr = base64Url.encode(utf8.encode(json.encode(payload)));

    final signatureRaw = '$headerStr.$payloadStr|secret_salt';
    final signature = sha256.convert(utf8.encode(signatureRaw)).toString();
    final signatureStr = base64Url.encode(utf8.encode(signature));

    return '$headerStr.$payloadStr.$signatureStr';
  }

  static bool isTokenExpired(String token) {
    try {
      final payloadStr = token.split('.')[1];
      final decodedPayload = base64Url.decode(payloadStr);
      final payload = json.decode(utf8.decode(decodedPayload));
      final exp = payload['exp'] as int;
      return DateTime.now().millisecondsSinceEpoch ~/ 1000 > exp;
    } catch (e) {
      return true;
    }
  }
}
