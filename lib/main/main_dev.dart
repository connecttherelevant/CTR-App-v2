/// dev config where chucker will be here and other dev tools

import 'package:flutter/material.dart';
import 'package:musicidia/core/navigation/route_manager.dart';
import 'package:musicidia/core/constants/theme/theme.dart';
import 'package:musicidia/core/navigation/routes_name.dart';
import 'package:musicidia/main/common_main.dart';
import 'package:musicidia/modules/splash/splash.dart';

class MyAppDev extends StatefulWidget {
  const MyAppDev({Key? key}) : super(key: key);

  @override
  MyAppDevState createState() => MyAppDevState();
}

class MyAppDevState extends MainBaseStatefulWidget<MyAppDev> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: const SplashScreen(),
      initialRoute: Routes.splashScreen,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
