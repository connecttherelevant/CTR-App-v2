import 'package:flutter/material.dart';

abstract class BaseStatefulWidget<T extends StatefulWidget> extends State<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    print("================================CALLED");
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }
}
