part of 'recipe_bloc.dart';

class RecipeState extends Equatable {
  final Recipe recipe;

  const RecipeState(this.recipe);

  @override
  List<Object?> get props => [recipe];
}

class InitialState extends RecipeState {
  const InitialState(super.recipe);
}

class DateState extends RecipeState {
  const DateState(super.recipe);
}

class FreezerState extends RecipeState {
  const FreezerState(super.recipe);
}

class RecipesState extends RecipeState {
  const RecipesState(super.recipe);
}

class ErrorState extends RecipeState {
  const ErrorState(super.recipe);
}

class LoadingState extends RecipeState {
  const LoadingState(super.recipe);
}

class Recipe extends Equatable {
  final List<Ingredients>? ingredient;
  final List<Recipes>? recipe;
  final String? errorMessage;
  final String? date;

  const Recipe({
    this.ingredient,
    this.recipe,
    this.errorMessage,
    this.date,
  });

  Recipe copyWith({
    List<Ingredients>? ingredient,
    List<Recipes>? recipe,
    String? errorMessage,
    String? date,
  }) {
    return Recipe(
      ingredient: ingredient ?? this.ingredient,
      recipe: recipe ?? this.recipe,
      errorMessage: errorMessage ?? this.errorMessage,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [
        ingredient,
        errorMessage,
        date,
      ];
}
