import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  /// Widgets Flutter Binding
  final widgetsFlutterBinding = WidgetsFlutterBinding.ensureInitialized();

  /// flutter native splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsFlutterBinding);

  /// Get Storage Initialization
  await GetStorage.init();

  /// Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(AuthenticationRepository());
  });

  /// Prevent the screen from rotating
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}
