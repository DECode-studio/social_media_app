import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media_app/core/constants/colors.dart';
import 'package:social_media_app/core/widgets/custom_button.dart';
import 'package:social_media_app/core/widgets/custom_text_field.dart';
import 'package:social_media_app/features/auth/controller/auth_controller.dart';
import 'package:social_media_app/features/auth/view/register_screen.dart';

class LoginScreen extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login", style: TextStyle(color: AppColors.primary)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Text(
              "Welcome Back",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
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
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style: TextStyle(color: AppColors.primary)),
              ),
            ),
            SizedBox(height: 30),
            Obx(() => CustomButton(
                  text: controller.isLoading.value ? "Logging in..." : "Login",
                  onPressed: () {
                    controller.login(emailCtrl.text, passCtrl.text);
                  },
                  isLoading: controller.isLoading.value,
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                TextButton(
                  onPressed: () => Get.to(() => RegisterScreen()),
                  child: Text("Register",
                      style: TextStyle(color: AppColors.primary)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
