import 'package:recipe_app/modules/recipe/data/datasource/api/recipe_service.dart';
import 'package:recipe_app/modules/recipe/data/datasource/dto/recipe_dto.dart';
import 'package:recipe_app/modules/recipe/data/datasource/remote/mapper/freezer_dto_mapper.dart';
import 'package:recipe_app/modules/recipe/data/datasource/remote/mapper/recipe_dto_mapper.dart';

import '../dto/freezer_dto.dart';

abstract class RecipeDataSource {
  Future<FreezerDto> getIngredients();
  Future<RecipeDto> getRecipes(String ingredients);
}

class RecipeDataSourceImpl implements RecipeDataSource {
  RecipeDataSourceImpl({
    required RecipeService recipeService,
    required FreezerDtoMapper mapper,
    required RecipeDtoMapper recipeDtoMapper,
  })  : _recipeService = recipeService,
        _mapper = mapper,
        _recipeDtoMapper = recipeDtoMapper;

  final RecipeService _recipeService;
  final FreezerDtoMapper _mapper;
  final RecipeDtoMapper _recipeDtoMapper;
  @override
  Future<FreezerDto> getIngredients() async {
    final response = await _recipeService.getIngredients();
    return _mapper.map(response);
  }

  @override
  Future<RecipeDto> getRecipes(String ingredients) async {
    final response = await _recipeService.getRecipe(ingredients);
    return _recipeDtoMapper.map(response);
  }
}
