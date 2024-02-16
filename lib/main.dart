import 'package:flutter/material.dart';
import 'package:musicidia/core/config/app_config.dart';
import 'package:musicidia/core/utils/status_bar.dart';
import 'package:musicidia/main/main_dev.dart';
import 'package:musicidia/main/main_prod.dart';

// todo: update main functions config, http, inilized functions.
void main() {
  // Appstatus bar color
  StatusBarUtil.instance.lightThemeStatusBar();

  runApp(appConfig.isProduction ? const MyAppProd() : const MyAppDev());
}
