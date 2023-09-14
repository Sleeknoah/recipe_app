import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:recipe_app/modules/recipe/domain/entities/recipe_entity.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/filter_ingredients_usecase.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/get_ingredients_usecase.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/get_recipe_usecase.dart';

import '../../domain/entities/ingredient_entity.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  RecipeBloc({
    required IngredientUsecase ingredientUsecase,
    required FilterIngredientUsecase filterIngredientUsecase,
    required RecipeUsecase recipeUsecase,
  })  : _ingredientUsecase = ingredientUsecase,
        _filterIngredientUsecase = filterIngredientUsecase,
        _recipeUsecase = recipeUsecase,
        super(const InitialState(Recipe())) {
    on<GetIngredientEvent>(_getIngredients);
    on<FilterIngredientEvent>(_filterIngredients);
    on<GetRecipeEvent>(_getRecipe);
  }
  final IngredientUsecase _ingredientUsecase;
  final FilterIngredientUsecase _filterIngredientUsecase;
  final RecipeUsecase _recipeUsecase;

  Future<void> _getIngredients(
      GetIngredientEvent event, Emitter<RecipeState> emit) async {
    emit(LoadingState(state.recipe));
    final response = await _ingredientUsecase.execute();
    response.fold((errorResponse) {
      emit(
        ErrorState(
          state.recipe.copyWith(errorMessage: errorResponse.message),
        ),
      );
    }, (entityResponse) {
      emit(
        DateState(
          state.recipe.copyWith(
            ingredient: entityResponse.ingredientList,
          ),
        ),
      );
    });
  }

  void _filterIngredients(
    FilterIngredientEvent event,
    Emitter<RecipeState> emit,
  ) {
    final filteredList = _filterIngredientUsecase.filterByDate(
      event.ingredients,
      event.dateOfLunch,
    );
    var dateFormat = DateFormat('dd-MM-yyyy');
    emit(
      FreezerState(
        state.recipe.copyWith(
          ingredient: filteredList,
          date: dateFormat.format(event.dateOfLunch),
        ),
      ),
    );
  }

  Future<void> _getRecipe(
      GetRecipeEvent event, Emitter<RecipeState> emit) async {
    emit(LoadingState(state.recipe));
    final response = await _recipeUsecase.execute(event.ingredients);
    response.fold((errorResponse) {
      emit(
        ErrorState(
          state.recipe.copyWith(errorMessage: errorResponse.message),
        ),
      );
    }, (entityResponse) {
      emit(
        RecipesState(
          state.recipe.copyWith(
            recipe: entityResponse.recipeList,
          ),
        ),
      );
    });
  }
}
