import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/modules/recipe/domain/entities/ingredient_entity.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_app/modules/recipe/presentation/widgets/date_card.dart';

import '../../../../core/constants/app_colors.dart';

class DateScreen extends StatelessWidget {
  const DateScreen({
    Key? key,
    this.dataSet,
  }) : super(key: key);

  final List<Ingredients>? dataSet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),
          child: ListView(
            children: [
              Text(
                'Recipe App',
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.buttonColorSecondary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Text(
                'Select your preferred launch date below',
                style: GoogleFonts.nunito(
                  textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.buttonColorSecondary,
                        // fontSize: 14,
                      ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              dataSet != null
                  ? MasonryGridView.builder(
                      gridDelegate:
                          const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      itemCount: dataSet?.length,
                      itemBuilder: (BuildContext context, int index) {
                        var date = dataSet?[index].useBy;
                        return InkWell(
                          onTap: () {
                            context.read<RecipeBloc>().add(
                                  FilterIngredientEvent(
                                      date ?? DateTime(2020), dataSet!),
                                );
                            // Navigator.of(context).push(
                            //   _createRoute(index),
                            // );
                          },
                          child: DateCardWidget(
                            launchDate: dataSet?[index].useBy ?? DateTime(2020),
                          ),
                        );
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
