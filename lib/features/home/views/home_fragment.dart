import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/core/widgets/loading_indicator.dart';
import 'package:social_media_app/core/widgets/post_item_widget.dart';
import 'package:social_media_app/features/home/controller/data_controller.dart';

class HomeFragment extends StatelessWidget {
  HomeFragment({super.key});

  final dataCtrl = Get.find<DataController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dataCtrl.isLoading.value && dataCtrl.posts.isEmpty) {
        return LoadingIndicator();
      }

      return RefreshIndicator(
        onRefresh: () async {
          dataCtrl.loadPosts();
        },
        child: ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: dataCtrl.posts.length,
          itemBuilder: (context, index) {
            final post = dataCtrl.posts[index];
            return PostItemWidget(
              title: post.title,
              description: post.description,
              imageUrl: post.imageUrl,
              authorName: post.authorName,
              createdAt: post.createdAt,
              onLike: () {
                Get.snackbar("Liked!", "You liked ${post.title}");
              },
            );
          },
        ),
      );
    });
  }
}
