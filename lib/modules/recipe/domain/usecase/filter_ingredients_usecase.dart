import '../entities/ingredient_entity.dart';
import '../repository.dart';

abstract class FilterIngredientUsecase {
  List<Ingredients> filterByDate(
      List<Ingredients> ingredients, DateTime filterDate);
}

class FilterIngredientUsecaseImpl extends FilterIngredientUsecase {
  FilterIngredientUsecaseImpl({
    required RecipeRepository repository,
  }) : _repository = repository;

  final RecipeRepository _repository;

  @override
  List<Ingredients> filterByDate(
    List<Ingredients> ingredients,
    DateTime filterDate,
  ) {
    return ingredients.map((e) {
      return Ingredients(
        title: e.title,
        useBy: e.useBy,
        isValid: (e.useBy.isBefore(filterDate) ||
            e.useBy.isAtSameMomentAs(filterDate)),
      );
    }).toList();
  }
}
