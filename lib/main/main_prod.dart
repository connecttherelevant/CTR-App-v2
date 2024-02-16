/// dev config where chucker will be here and other dev tools

import 'package:flutter/material.dart';
import 'package:musicidia/core/config/app_config.dart';
import 'package:musicidia/core/constants/theme/theme.dart';
import 'package:musicidia/main/common_main.dart';

class MyAppProd extends StatefulWidget {
  const MyAppProd({Key? key}) : super(key: key);

  @override
  MyAppProdState createState() => MyAppProdState();
}

class MyAppProdState extends MainBaseStatefulWidget<MyAppProd> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(),
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(30),
          child: Text(appConfig.appName),
        ),
      ),
    );
  }
}
