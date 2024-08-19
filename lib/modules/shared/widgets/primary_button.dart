import 'package:flutter/material.dart';
import 'package:musicidia/core/constants/colors.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final double height;
  final String content;
  final VoidCallback onClick;
  final EdgeInsetsGeometry? margin;
  final bool disable;

  const PrimaryButton({
    Key? key,
    required this.width,
    required this.height,
    required this.onClick,
    required this.content,
    this.margin,
    required this.disable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: disable ? AppColors.disableBtnColor : AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onClick,
        child: Center(
          child: Text(
            content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.39,
            ),
          ),
        ),
      ),
    );
  }
}
