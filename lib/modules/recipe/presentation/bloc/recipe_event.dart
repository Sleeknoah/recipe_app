part of 'recipe_bloc.dart';

class RecipeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetIngredientEvent implements RecipeEvent {
  GetIngredientEvent();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class FilterIngredientEvent implements RecipeEvent {
  final DateTime dateOfLunch;
  final List<Ingredients> ingredients;
  const FilterIngredientEvent(
    this.dateOfLunch,
    this.ingredients,
  );

  @override
  List<Object?> get props => [
        dateOfLunch,
        ingredients,
      ];

  @override
  bool? get stringify => true;
}

class GetRecipeEvent implements RecipeEvent {
  final String ingredients;
  GetRecipeEvent(
    this.ingredients,
  );

  @override
  List<Object?> get props => [
        ingredients,
      ];

  @override
  bool? get stringify => true;
}
