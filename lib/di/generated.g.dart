// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Kiwi extends Kiwi {
  @override
  void usecase() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<IngredientUsecase>(
          (c) => IngredientUsecaseImpl(repository: c<RecipeRepository>()))
      ..registerSingleton<RecipeUsecase>(
          (c) => RecipeUsecaseImpl(repository: c<RecipeRepository>()))
      ..registerSingleton<FilterIngredientUsecase>((c) =>
          FilterIngredientUsecaseImpl(repository: c<RecipeRepository>()));
  }

  @override
  void blocs() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => RecipeBloc(
        ingredientUsecase: c<IngredientUsecase>(),
        filterIngredientUsecase: c<FilterIngredientUsecase>(),
        recipeUsecase: c<RecipeUsecase>()));
  }

  @override
  void repositories() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton<RecipeRepository>((c) => RecipeRepositoryImpl(
        recipeDataSource: c<RecipeDataSource>(),
        mapper: c<FreezerDtoEntityMapper>(),
        recipeDtoEntityMapper: c<RecipeDtoEntityMapper>()));
  }

  @override
  void services() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<RecipeService>(
          (c) => RecipeServiceImpl(networkService: c<NetworkService>()))
      ..registerSingleton<RecipeDataSource>((c) => RecipeDataSourceImpl(
          recipeService: c<RecipeService>(),
          mapper: c<FreezerDtoMapper>(),
          recipeDtoMapper: c<RecipeDtoMapper>()));
  }

  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => AppConfig())
      ..registerSingleton((c) => NetworkService())
      ..registerSingleton((c) => FreezerDtoMapper())
      ..registerSingleton((c) => FreezerDtoEntityMapper())
      ..registerSingleton((c) => RecipeDtoMapper())
      ..registerSingleton((c) => RecipeDtoEntityMapper());
  }
}
