import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/recipe_bloc.dart';

import '../../../../core/constants/app_colors.dart';

class RecipeButton extends StatelessWidget {
  const RecipeButton({Key? key, this.count = 0}) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeBloc, RecipeState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                decoration: const BoxDecoration(
                  color: AppColors.buttonColorSecondary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      7.0,
                    ),
                    bottomLeft: Radius.circular(
                      7.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: state is LoadingState
                      ? const SizedBox(
                          height: 25,
                          width: 25,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.utensils,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '$count',
                              style: GoogleFonts.nunito(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ],
                        ),
                )),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(
                    7.0,
                  ),
                  bottomRight: Radius.circular(
                    7.0,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: Text(
                  'Get Recipe',
                  style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
