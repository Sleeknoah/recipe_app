import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/core/constants/app_svgs.dart';
import 'package:recipe_app/modules/recipe/domain/entities/ingredient_entity.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/cubit/ingredient_cubit.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  final Ingredients recipe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientCubit, IngredientState>(
      builder: (context, state) {
        return SizedBox(
          height: 100,
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                recipe.isValid!
                    ? Container(
                        child: Image.asset(
                          'assets/pngs/plate.jpg',
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Container(
                        child: ColorFiltered(
                          colorFilter: AppColors.colorFilter,
                          child: Image.asset(
                            'assets/pngs/plate.jpg',
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                recipe.isValid!
                    ? Container(
                        color: Colors.black38,
                      )
                    : Container(
                        color: Colors.black26,
                      ),
                Center(
                  child: Text(
                    recipe.title,
                    style: GoogleFonts.nunito(
                      textStyle:
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: Colors.white,
                                fontSize: 25,
                              ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                state.ingredients.contains(recipe.title)
                    ? Positioned(
                        right: 5,
                        top: 5,
                        child: AppSvgs.checked(),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
