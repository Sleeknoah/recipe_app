import 'package:recipe_app/core/utils/mapper.dart';
import 'package:recipe_app/modules/recipe/data/datasource/dto/freezer_dto.dart';
import 'package:recipe_app/modules/recipe/domain/entities/ingredient_entity.dart';

class FreezerDtoEntityMapper implements Mapper<FreezerDto, FreezerEntity> {
  @override
  FreezerEntity map(FreezerDto type) {
    return FreezerEntity(
        ingredientList: type.freezer.map(
      (e) {
        return Ingredients(title: e.title, useBy: e.useBy);
      },
    ).toList());
  }
}
