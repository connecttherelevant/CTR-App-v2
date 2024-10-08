import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:musicidia/core/constants/assets.dart';
import 'package:musicidia/core/constants/widget_size.dart';
import 'package:musicidia/core/navigation/routes_name.dart';
import 'package:musicidia/modules/shared/animated/fade_transition/widget.dart';
import 'package:musicidia/modules/shared/wrapper/base_stateful_widget.dart';

// Todo: Add redirection methods/logic.

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends BaseStatefulWidget<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      pushNamed(Routes.welcomeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: FadeTransitionWidget(
          duration: 2,
          curves: Curves.easeIn,
          child: SizedBox(
            width: k200Width,
            height: k86Height,
            child: Center(
              child: Lottie.asset(kSplashLogoAnimation),
            ),
          ),
        ),
      ),
    );
  }
}
