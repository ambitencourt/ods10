import 'package:flutter/material.dart';
import 'package:ods10/app/common/resources/app_colors.dart';

class CircularButtom extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  const CircularButtom({Key? key, required this.child, required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPress,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(child: child),
      ),
    );
  }
}
