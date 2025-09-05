import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:social_media_app/core/constants/colors.dart';
import 'package:social_media_app/core/utils/base64_utils.dart';

class ImagePickerWidget extends StatelessWidget {
  final String? imageUrl;
  final void Function(String base64) onImageSelected;

  const ImagePickerWidget({
    super.key,
    this.imageUrl,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload Image",
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final base64 = await Base64Utils.pickImageAndConvertToBase64();
            if (base64 != null) {
              onImageSelected(base64);
            }
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[100],
            ),
            child: Center(
              child: imageUrl != null
                  ? Image.memory(base64Decode(imageUrl ?? ""),
                      fit: BoxFit.cover)
                  : Icon(Icons.add_a_photo, color: AppColors.textSecondary),
            ),
          ),
        ),
      ],
    );
  }
}
