import 'package:recipe_app/modules/recipe/data/datasource/api/model/response/freezer_model.dart';
import 'package:recipe_app/modules/recipe/data/datasource/dto/freezer_dto.dart';

import '../../../../../../core/utils/mapper.dart';

class FreezerDtoMapper implements Mapper<List<FreezerResponse>, FreezerDto> {
  @override
  FreezerDto map(List<FreezerResponse> type) {
    return FreezerDto(
      freezer: type
          .map(
            (e) => Freezer(title: e.title, useBy: e.useBy),
          )
          .toList(),
    );
  }
}
