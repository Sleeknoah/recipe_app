import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:recipe_app/core/constants/app_colors.dart';

class AppSvgs {
  static Widget checked() {
    return SvgPicture.asset(
      'assets/svgs/checked.svg',
      color: AppColors.buttonColor,
    );
  }
}
