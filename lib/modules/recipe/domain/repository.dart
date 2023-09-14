import 'package:recipe_app/core/utils/error_response.dart';
import 'package:recipe_app/modules/recipe/domain/entities/ingredient_entity.dart';
import 'package:recipe_app/modules/recipe/domain/entities/recipe_entity.dart';
import 'package:ruqe/ruqe.dart';

abstract class RecipeRepository {
  Future<Either<ErrorResponse, FreezerEntity>> getFreezer();
  Future<Either<ErrorResponse, RecipeEntity>> getRecipe(String ingredients);
}
