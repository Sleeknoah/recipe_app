import 'package:recipe_app/core/constants/network_constants.dart';
import 'package:recipe_app/core/constants/network_service.dart';
import 'package:recipe_app/modules/recipe/data/datasource/api/exceptions/ingredient_exception.dart';
import 'package:recipe_app/modules/recipe/data/datasource/api/model/response/freezer_model.dart';
import 'package:recipe_app/modules/recipe/data/datasource/api/model/response/recipe_model.dart';

abstract class RecipeService {
  Future<List<FreezerResponse>> getIngredients();
  Future<List<RecipeModel>> getRecipe(String ingredients);
}

class RecipeServiceImpl implements RecipeService {
  RecipeServiceImpl({
    required NetworkService networkService,
  }) : _networkService = networkService;

  final NetworkService _networkService;
  @override
  Future<List<FreezerResponse>> getIngredients() async {
    try {
      final response =
          await _networkService.get(url: NetworkConstants.ingredients);
      return freezerFromJson(response);
    } on NoSuchMethodError {
      throw IngredientException(
        message: "Oops something went wrong... Please try again",
        status: '400',
      );
    } catch (e) {
      print(e.toString());
      throw IngredientException.fromJson(e);
    }
  }

  @override
  Future<List<RecipeModel>> getRecipe(String ingredients) async {
    try {
      final queryParams =
          Uri(queryParameters: {'ingredients': ingredients}).query;
      final response = await _networkService.get(
        url: NetworkConstants.recipes,
        query: queryParams,
      );
      print(response);
      return recipeModelFromJson(response);
    } on NoSuchMethodError {
      throw IngredientException(
        message: "Oops something went wrong... Please try again",
        status: '400',
      );
    } catch (e) {
      print(e.toString());
      throw IngredientException.fromJson(e);
    }
  }
}
