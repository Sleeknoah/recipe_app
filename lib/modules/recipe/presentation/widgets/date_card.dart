import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/core/constants/app_colors.dart';

class DateCardWidget extends StatelessWidget {
  const DateCardWidget({
    Key? key,
    required this.launchDate,
  }) : super(key: key);

  final DateTime launchDate;
  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd-MM-yyyy');

    return Material(
      color: Colors.white,
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            dateFormat.format(launchDate),
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.buttonColorSecondary,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
