import 'package:kiwi/kiwi.dart';
import 'package:recipe_app/core/constants/network_service.dart';
import 'package:recipe_app/modules/recipe/data/datasource/remote/mapper/recipe_repository.dart';
import 'package:recipe_app/modules/recipe/data/mapper/dto_to_entity_mapper/ingredient_dto_to_entity_mapper.dart';
import 'package:recipe_app/modules/recipe/domain/repository.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/filter_ingredients_usecase.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/app_config.dart';
import '../modules/recipe/data/datasource/api/recipe_service.dart';
import '../modules/recipe/data/datasource/remote/mapper/freezer_dto_mapper.dart';
import '../modules/recipe/data/datasource/remote/mapper/recipe_dto_mapper.dart';
import '../modules/recipe/data/datasource/remote/recipe_datasource.dart';
import '../modules/recipe/data/mapper/dto_to_entity_mapper/recipe_dto_to_entity_mapper.dart';
import '../modules/recipe/domain/usecase/get_ingredients_usecase.dart';
import '../modules/recipe/domain/usecase/get_recipe_usecase.dart';

part 'generated.g.dart';

abstract class Kiwi {
  static final inject = KiwiContainer();

  static Future<void> setup() async {
    var kiwi = _$Kiwi();

    kiwi.repositories();
    kiwi.services();
    // kiwi.blocs();
    kiwi.configure();
    // kiwi.mapper();
    kiwi.usecase();

    /// I Registered SharedPreferences this way because it need
    /// to be instantiated before it actual registration with Kiwi.
    final sharedPreferences = await SharedPreferences.getInstance();
    inject.registerSingleton((_) => sharedPreferences);
  }

  @Register.singleton(IngredientUsecase, from: IngredientUsecaseImpl)
  @Register.singleton(RecipeUsecase, from: RecipeUsecaseImpl)
  @Register.singleton(FilterIngredientUsecase,
      from: FilterIngredientUsecaseImpl)
  void usecase();

  @Register.singleton(RecipeBloc)
  void blocs();

  @Register.singleton(RecipeRepository, from: RecipeRepositoryImpl)
  void repositories();

  @Register.singleton(RecipeService, from: RecipeServiceImpl)
  @Register.singleton(RecipeDataSource, from: RecipeDataSourceImpl)
  void services();

  @Register.singleton(AppConfig)
  @Register.singleton(NetworkService)
  @Register.singleton(FreezerDtoMapper)
  @Register.singleton(FreezerDtoEntityMapper)
  @Register.singleton(RecipeDtoMapper)
  @Register.singleton(RecipeDtoEntityMapper)
  void configure();
}
