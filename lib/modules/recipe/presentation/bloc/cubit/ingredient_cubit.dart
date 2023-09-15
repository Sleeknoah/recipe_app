import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'ingredient_state.dart';

class IngredientCubit extends Cubit<IngredientState> {
  IngredientCubit() : super(const IngredientState());

  void addIngredient(String ingredient) {
    if (state.ingredients.contains(ingredient)) {
      removeIngredient(ingredient);
    } else {
      emit(state.copyWith(
        ingredients: List.from(state.ingredients)..add(ingredient),
      ));
    }
  }

  void removeIngredient(String ingredient) {
    emit(state.copyWith(
      ingredients: List.from(state.ingredients)..remove(ingredient),
    ));
  }

  void clearIngredients() {
    emit(state.copyWith(
      ingredients: List.from(state.ingredients)..clear(),
    ));
  }
}
