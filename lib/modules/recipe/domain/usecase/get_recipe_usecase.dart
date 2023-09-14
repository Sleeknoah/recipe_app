import 'package:ruqe/ruqe.dart';

import '../../../../core/utils/error_response.dart';
import '../entities/recipe_entity.dart';
import '../repository.dart';

abstract class RecipeUsecase {
  Future<Either<ErrorResponse, RecipeEntity>> execute(String ingredients);
}

class RecipeUsecaseImpl extends RecipeUsecase {
  RecipeUsecaseImpl({
    required RecipeRepository repository,
  }) : _repository = repository;

  final RecipeRepository _repository;
  @override
  Future<Either<ErrorResponse, RecipeEntity>> execute(ingredients) async {
    return await _repository.getRecipe(ingredients);
  }
}
