import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/core/constants/colors.dart';

// ignore: must_be_immutable
class PostItemWidget extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String authorName;
  final DateTime createdAt;
  final VoidCallback onLike;
  var isLiked = false.obs;

  PostItemWidget({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.authorName,
    required this.createdAt,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar
            if (imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.memory(
                  base64Decode(imageUrl),
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

            // Konten
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: AppColors.textSecondary),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$authorName • ${formatDate(createdAt)}',
                        style: TextStyle(
                            fontSize: 12, color: AppColors.textSecondary),
                      ),
                      IconButton(
                        icon: Icon(
                          isLiked.value
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: isLiked.value
                              ? Colors.red
                              : AppColors.textSecondary,
                        ),
                        onPressed: () {
                          onLike();
                          isLiked.value = !isLiked.value;
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  String formatDate(DateTime date) {
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inHours < 1) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    return '${date.day}/${date.month}';
  }
}
