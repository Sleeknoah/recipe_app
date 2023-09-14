import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipe_app/core/constants/app_colors.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/get_ingredients_usecase.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/get_recipe_usecase.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/cubit/ingredient_cubit.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_app/modules/recipe/presentation/screens/date_screen.dart';
import 'package:recipe_app/modules/recipe/presentation/screens/recipe_screen.dart';
import 'package:recipe_app/modules/recipe/presentation/widgets/bottom_bar.dart';
import 'package:recipe_app/modules/recipe/presentation/widgets/ingredient_card.dart';
import 'package:recipe_app/modules/recipe/presentation/widgets/loading%20screen.dart';

import '../../../../di/generated.dart';
import '../../domain/usecase/filter_ingredients_usecase.dart';
import '../widgets/app_bar.dart';

part 'ingredients_view.dart';

class FreezerScreen extends StatelessWidget {
  const FreezerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RecipeBloc(
        ingredientUsecase: Kiwi.inject<IngredientUsecase>(),
        filterIngredientUsecase: Kiwi.inject<FilterIngredientUsecase>(),
        recipeUsecase: Kiwi.inject<RecipeUsecase>(),
      )..add(GetIngredientEvent()),
      child: BlocConsumer<RecipeBloc, RecipeState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const LoaderWidget();
          }
          if (state is DateState) {
            return DateScreen(dataSet: state.recipe.ingredient);
          }
          return const Scaffold();
        },
        listener: (context, state) {
          if (state is FreezerState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => IngredientView(
                  recipe: state.recipe,
                  date: state.recipe.date ?? '',
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
