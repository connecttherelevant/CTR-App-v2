import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:musicidia/core/constants/assets.dart';
import 'package:musicidia/core/constants/colors.dart';
import 'package:musicidia/core/constants/widget_size.dart';
import 'package:musicidia/core/navigation/routes_name.dart';
import 'package:musicidia/external/carousel_indicator.dart';
import 'package:musicidia/modules/shared/widgets/primary_button.dart';
import 'package:musicidia/modules/shared/wrapper/base_stateful_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppWelcomeScreen extends StatefulWidget {
  const AppWelcomeScreen({Key? key}) : super(key: key);
  @override
  AppWelcomeScreenState createState() => AppWelcomeScreenState();
}

class AppWelcomeScreenState extends BaseStatefulWidget<AppWelcomeScreen> {
  int slideIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: PrimaryButton(
          margin: const EdgeInsets.only(bottom: 24),
          width: ScreenUtil().setHeight(335.0),
          disable: false,
          onClick: () => {pushNamed(Routes.loginScreen)},
          height: k50Height,
          content: "Get Started",
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(kAppLogoSvg, width: 200.0),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Center(
                    child: SizedBox(
                      height: k150Height,
                      child: Lottie.asset(kWelcomeWorldAnimation),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: k100Height,
                    child: PageView.builder(
                        itemCount: 3,
                        onPageChanged: (index) {
                          setState(() {
                            slideIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Column(
                              children: [
                                // Adjust the spacing between image and text
                                Text(
                                  'Welcome to CTR',
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Text(
                                  'The Stage is Set: Connect, Collaborate, Conquer.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  // indicator
                  CarouselIndicator(
                    count: 3,
                    index: slideIndex,
                    cornerRadius: 100,
                    width: 10,
                    height: 10,
                    color: AppColors.greyColor,
                    activeColor: AppColors.primaryColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
