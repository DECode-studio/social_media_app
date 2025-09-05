import 'dart:convert';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class Base64Utils {
  static Future<String?> pickImageAndConvertToBase64() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        final file = result.files.first;
        final bytes = file.bytes!;
        return base64Encode(bytes.toList());
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image');
    }
    return null;
  }
}
