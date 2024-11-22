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
          apiKey: "AIzaSyD68_uQ6TeuMMSulFl8iPRJRmsCYJaxl7c",
          appId: "1:959640937740:android:b3ada08764226e08299529",
          messagingSenderId: "959640937740",
          projectId: "chatter-app-308ec",
          storageBucket: "chatter-app-308ec.appspot.com"));
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
