import 'package:recipe_app/core/utils/mapper.dart';
import 'package:recipe_app/modules/recipe/data/datasource/dto/recipe_dto.dart';
import 'package:recipe_app/modules/recipe/domain/entities/recipe_entity.dart';

class RecipeDtoEntityMapper implements Mapper<RecipeDto, RecipeEntity> {
  @override
  RecipeEntity map(RecipeDto type) {
    return RecipeEntity(
        recipeList: type.recipe.map(
      (e) {
        return Recipes(
          ingredients: e.ingredients,
          title: e.title,
        );
      },
    ).toList());
  }
}
