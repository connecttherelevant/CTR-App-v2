import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicidia/core/constants/assets.dart';
import 'package:musicidia/core/constants/colors.dart';
import 'package:musicidia/core/constants/widget_size.dart';
import 'package:musicidia/modules/shared/widgets/primary_button.dart';
import 'package:musicidia/modules/shared/wrapper/base_stateful_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);
  @override
  AuthScreenState createState() => AuthScreenState();
}

class AuthScreenState extends BaseStatefulWidget<AuthScreen> {
  FocusNode numberFocusNode = FocusNode();
  TextEditingController numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    numberFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              // CTR Logo
              Expanded(
                child: Center(
                  child: SvgPicture.asset(kAppLogoSvg, width: k200Width),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: k16Height,
                  ),
                  Text(
                    "Please enter your mobile number to continue",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  // Phone Number input box
                  SizedBox(
                    height: k50Height,
                  ),
                  Text(
                    numberFocusNode.hasFocus ? 'Enter Number' : '',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  // Enter phone field
                  TextFormField(
                    keyboardType: TextInputType.number,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    focusNode: numberFocusNode,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    cursorColor: AppColors.primaryColor,
                    cursorHeight: k20Height,
                    decoration: InputDecoration(
                      // field prefix
                      prefix: SizedBox(
                        width: k60Width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: k21Width,
                              height: k14Height,
                              child: Image.asset(
                                kFlag,
                              ),
                            ),
                            SizedBox(
                              width: k5Width,
                            ),
                            Text(
                              '+91',
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: AppColors.textColor),
                            ),
                          ],
                        ),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 11.0),
                      hintText: 'Enter mobile',
                      hintStyle: Theme.of(context).textTheme.labelSmall,
                      border: InputBorder.none,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.greyColor,
                          width: k1Width,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: k1Width,
                        ),
                      ),
                    ),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: AppColors.textColor),
                    onChanged: (value) {
                      HapticFeedback.mediumImpact();
                      if (value.length == 10) {
                        FocusScope.of(context).unfocus();
                      }
                    },
                    onTap: () {
                      setState(() {});
                    },
                  ),

                  SizedBox(
                    height: k24Height,
                  ),
                  //Continue button
                  PrimaryButton(
                    width: ScreenUtil().setHeight(335.0),
                    height: k50Height,
                    onClick: () {},
                    disable: true,
                    content: 'Continue',
                  ),
                  SizedBox(
                    height: k24Height,
                  ),
                  // T & S
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'By tapping “Continue” you agree to the ',
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Text(
                        'Terms of Service',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.primaryColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: k25Height,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
