import 'package:flutter/material.dart';
import 'package:fruits_hub/features/Auth/presentation/views/sign_in_view.dart';
import 'package:fruits_hub/features/Auth/presentation/views/signup_view.dart';
import 'package:fruits_hub/features/Splash/presentation/views/splash_view.dart';
import 'package:fruits_hub/features/home/presentation/views/home_view.dart';
import 'package:fruits_hub/features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => const SignInView());
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text("Page Not Found")),
        ),
      );
  }
}
