import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/core/constants/colors.dart';
import 'package:social_media_app/core/widgets/custom_button.dart';
import 'package:social_media_app/core/widgets/custom_text_field.dart';
import 'package:social_media_app/features/auth/controller/auth_controller.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.find();
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register", style: TextStyle(color: AppColors.primary)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Create New Account",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            CustomTextField(label: "Name", controller: nameCtrl),
            SizedBox(height: 16),
            CustomTextField(
              label: "Email",
              controller: emailCtrl,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16),
            CustomTextField(
              label: "Password",
              controller: passCtrl,
              obscureText: true,
            ),
            SizedBox(height: 30),
            Obx(() => CustomButton(
                  text: controller.isLoading.value ? "Creating..." : "Register",
                  onPressed: () {
                    controller.register(
                        nameCtrl.text, emailCtrl.text, passCtrl.text);
                  },
                  isLoading: controller.isLoading.value,
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account? "),
                TextButton(
                  onPressed: () => Get.back(),
                  child:
                      Text("Login", style: TextStyle(color: AppColors.primary)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
