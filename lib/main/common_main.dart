import 'package:flutter/material.dart';

/// All the common function eg firebase, https

abstract class MainBaseStatefulWidget<T extends StatefulWidget> extends State<T>
    with WidgetsBindingObserver {

  // initiallzy all main widgets common function and configratuion here
  // eg: firebase,updates,sessions
  
  @override
  void initState() {
    super.initState();
  }
}
