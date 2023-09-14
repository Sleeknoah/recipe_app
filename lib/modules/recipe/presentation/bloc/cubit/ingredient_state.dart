part of 'ingredient_cubit.dart';

class IngredientState extends Equatable {
  final List<String> ingredients;

  const IngredientState({this.ingredients = const []});

  IngredientState copyWith({List<String>? ingredients}) {
    return IngredientState(ingredients: ingredients ?? this.ingredients);
  }

  @override
  List<Object> get props => [ingredients];
}
