import 'package:ruqe/ruqe.dart';

import '../../../../core/utils/error_response.dart';
import '../entities/ingredient_entity.dart';
import '../repository.dart';

abstract class IngredientUsecase {
  Future<Either<ErrorResponse, FreezerEntity>> execute();
}

class IngredientUsecaseImpl extends IngredientUsecase {
  IngredientUsecaseImpl({
    required RecipeRepository repository,
  }) : _repository = repository;

  final RecipeRepository _repository;
  @override
  Future<Either<ErrorResponse, FreezerEntity>> execute() async {
    return await _repository.getFreezer();
  }
}
