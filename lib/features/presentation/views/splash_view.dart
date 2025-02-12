import 'package:flutter/material.dart';
import 'package:fruits_hub/features/presentation/views/widget/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashViewBody(),
    );
  }
}
