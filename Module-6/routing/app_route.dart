import 'package:flutter/material.dart';
import '../constant/constants.dart';
import '../model/allUser.dart';
import '../view/chat/chat_screen.dart';
import '../view/home/home_view.dart';
import '../view/login/login_view.dart';
import '../view/signup/sign_view.dart';
import '../view/splash/splash_view.dart';
import '../view/on_boarding_view/on_boarding_view.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstant.splashView:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );

      case AppConstant.loginView:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );

      case AppConstant.signupView:
        return MaterialPageRoute(
          builder: (context) => SignupView(),
        );

      case AppConstant.homeView:
        return MaterialPageRoute(
          builder: (context) => HomeView(),
        );

      case AppConstant.onBoardingView:
        return MaterialPageRoute(
          builder: (context) => onBoardingView(),
        );

      case AppConstant.chatView:
        AllUser? allUser =
            settings.arguments != null ? settings.arguments as AllUser : null;
        return MaterialPageRoute(
          builder: (context) => ChatScreen(
              allUser: allUser),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
    }
  }
}
