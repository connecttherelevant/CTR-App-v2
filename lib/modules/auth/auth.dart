import 'package:flutter/material.dart';
import 'package:musicidia/modules/auth/infra/datasources/auth_api.dart';
import 'package:musicidia/modules/shared/wrapper/base_stateful_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends BaseStatefulWidget<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async {
              await AuthApiSource().sendVerificationCode('9152128731');
            },
            child: Text("AUTH SCREEN"),
          ),
        ],
      ),
    );
  }
}
