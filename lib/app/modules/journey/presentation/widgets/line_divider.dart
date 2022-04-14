import 'package:flutter/material.dart';
import 'package:ods10/app/common/resources/app_colors.dart';

class LineDivider extends StatelessWidget {
  const LineDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.ligthGrey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
