import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localdatabase/Module-6/routing/app_route.dart';
import 'package:flutter_localdatabase/Module-6/themes/app_theme.dart';
import 'constant/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await PrefUtils.init();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyDRAmI30yiSiqIYKhOfJptCQ_JiCk9oOlQ',
          appId: '1:496892810645:android:1658ad6f6534ad09fd529c',
          messagingSenderId: 'flutter-firebase-23a65.appspot.com',
          projectId: 'flutter-firebase-23a65',
          storageBucket: "flutter-firebase-23a65.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: AppConstant.splashView,
      onGenerateRoute: AppRoute.generateRoute,
    );
  }
}
