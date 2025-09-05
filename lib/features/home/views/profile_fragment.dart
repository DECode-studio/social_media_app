import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/core/services/storage_service.dart';
import 'package:social_media_app/core/widgets/custom_button.dart';
import 'package:social_media_app/features/auth/controller/auth_controller.dart';

class ProfileFragment extends StatelessWidget {
  final storage = StorageService();

  ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    final user = storage.getCurrentUser();

    return user == null
        ? Center(child: Text("No user logged in"))
        : Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, size: 60),
                ),
                SizedBox(height: 20),
                Text(
                  user.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  user.email,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 30),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text("My Posts"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                SizedBox(height: 30),
                CustomButton(
                  text: "Logout",
                  onPressed: () {
                    Get.find<AuthController>().logout();
                  },
                )
              ],
            ),
          );
  }
}
