import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:social_media_app/core/services/storage_service.dart';
import 'package:social_media_app/features/auth/controller/auth_controller.dart';
import 'package:social_media_app/features/home/controller/data_controller.dart';
import 'package:social_media_app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  Get.put(StorageService());
  Get.put(AuthController());
  Get.put(DataController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: StorageService().getToken() != null
          ? AppRoutes.HOME
          : AppRoutes.LOGIN,
      getPages: AppRoutes.routes,
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
    );
  }
}
