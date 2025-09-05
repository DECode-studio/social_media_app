import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/core/models/post_model.dart';
import 'package:social_media_app/core/services/storage_service.dart';
import 'package:social_media_app/core/widgets/custom_button.dart';
import 'package:social_media_app/core/widgets/custom_text_field.dart';
import 'package:social_media_app/features/home/controller/data_controller.dart';

class CreateContentFragment extends StatefulWidget {
  const CreateContentFragment({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateContentFragmentState createState() => _CreateContentFragmentState();
}

class _CreateContentFragmentState extends State<CreateContentFragment> {
  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  String? imageBase64;
  final dataCtrl = Get.find<DataController>();
  final user = Get.find<StorageService>().getCurrentUser();

  void savePost() {
    if (titleCtrl.text.isEmpty || descCtrl.text.isEmpty) {
      Get.snackbar("Error", "Title and description required");
      return;
    }

    final post = Post(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleCtrl.text,
      description: descCtrl.text,
      imageUrl: imageBase64 ?? '',
      userId: user?.id ?? 'unknown',
      authorName: user?.name ?? 'Anonymous',
      createdAt: DateTime.now(),
      likes: 0,
    );

    dataCtrl.addPost(post);
    Get.back();
    Get.back(); // Tutup bottom sheet
    Get.snackbar("Success", "Post published!");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Text(
            "Create New Post",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          CustomTextField(label: "Title", controller: titleCtrl),
          SizedBox(height: 16),
          CustomTextField(
            label: "Description",
            controller: descCtrl,
            maxLines: 4,
          ),
          SizedBox(height: 20),
          CustomButton(
            text: "Publish",
            onPressed: savePost,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
