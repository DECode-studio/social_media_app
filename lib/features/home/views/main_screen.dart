import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/features/home/controller/page_controller.dart';
import 'package:social_media_app/features/home/views/create_content_fragment.dart';
import 'package:social_media_app/features/home/views/home_fragment.dart';
import 'package:social_media_app/features/home/views/profile_fragment.dart';

class MainScreen extends StatelessWidget {
  final pageCtrl = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeFragment(),
      ProfileFragment(),
    ];

    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: screens[pageCtrl.currentIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: pageCtrl.currentIndex.value,
          onTap: (index) => pageCtrl.changePage(index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Get.theme.primaryColor,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // Gunakan Get.bottomSheet()
          Get.bottomSheet(
            CreateContentFragment(),
            isScrollControlled: true,
            backgroundColor: Colors.white,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
          );
        },
      ),
    );
  }
}
