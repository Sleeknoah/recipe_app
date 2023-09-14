import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';

class RecipeAppBar extends StatelessWidget {
  const RecipeAppBar({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/pngs/avatar.png'),
        Row(
          children: [
            const FaIcon(
              FontAwesomeIcons.calendar,
              size: 16,
              color: AppColors.buttonColorSecondary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              date,
              style: GoogleFonts.nunito(
                textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.buttonColorSecondary,
                    ),
              ),
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset('assets/svgs/notification.svg'),
        )
      ],
    );
  }
}
