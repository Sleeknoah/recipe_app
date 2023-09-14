import 'package:recipe_app/core/utils/error_response.dart';
import 'package:recipe_app/modules/recipe/data/datasource/api/exceptions/ingredient_exception.dart';
import 'package:recipe_app/modules/recipe/data/mapper/dto_to_entity_mapper/ingredient_dto_to_entity_mapper.dart';
import 'package:recipe_app/modules/recipe/domain/entities/ingredient_entity.dart';
import 'package:recipe_app/modules/recipe/domain/entities/recipe_entity.dart';
import 'package:recipe_app/modules/recipe/domain/repository.dart';
import 'package:ruqe/ruqe.dart';

import '../../../mapper/dto_to_entity_mapper/recipe_dto_to_entity_mapper.dart';
import '../recipe_datasource.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl({
    required RecipeDataSource recipeDataSource,
    required FreezerDtoEntityMapper mapper,
    required RecipeDtoEntityMapper recipeDtoEntityMapper,
  })  : _recipeDataSource = recipeDataSource,
        _mapper = mapper,
        _recipeDtoEntityMapper = recipeDtoEntityMapper;

  final RecipeDataSource _recipeDataSource;
  final FreezerDtoEntityMapper _mapper;
  final RecipeDtoEntityMapper _recipeDtoEntityMapper;
  @override
  Future<Either<ErrorResponse, FreezerEntity>> getFreezer() async {
    try {
      final response = await _recipeDataSource.getIngredients();
      final entity = _mapper.map(response);
      return Right(entity);
    } on IngredientException catch (error) {
      return Left(ErrorResponse.generic(error.message));
    }
  }

  @override
  Future<Either<ErrorResponse, RecipeEntity>> getRecipe(
      String ingredients) async {
    try {
      final response = await _recipeDataSource.getRecipes(ingredients);
      final entity = _recipeDtoEntityMapper.map(response);
      return Right(entity);
    } on IngredientException catch (error) {
      return Left(ErrorResponse.generic(error.message));
    }
  }
}
