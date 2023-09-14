import 'package:recipe_app/modules/recipe/data/datasource/api/model/response/recipe_model.dart';
import 'package:recipe_app/modules/recipe/data/datasource/dto/recipe_dto.dart';

import '../../../../../../core/utils/mapper.dart';

class RecipeDtoMapper implements Mapper<List<RecipeModel>, RecipeDto> {
  @override
  RecipeDto map(List<RecipeModel> type) {
    return RecipeDto(
      recipe: type
          .map(
            (e) => Recipe(
              title: e.title,
              ingredients: e.ingredients,
            ),
          )
          .toList(),
    );
  }
}
