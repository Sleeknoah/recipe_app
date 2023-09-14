import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/di/generated.dart';
import 'package:recipe_app/modules/recipe/data/datasource/api/model/response/freezer_model.dart';
import 'package:recipe_app/modules/recipe/data/datasource/api/recipe_service.dart';
import 'package:recipe_app/modules/recipe/domain/entities/ingredient_entity.dart';
import 'package:recipe_app/modules/recipe/domain/repository.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/filter_ingredients_usecase.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/get_ingredients_usecase.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/get_recipe_usecase.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc_test.mocks.dart';

@GenerateMocks([
  RecipeRepository,
  IngredientUsecase,
  FilterIngredientUsecase,
  RecipeService,
])
final mockPayload = Recipe(ingredient: [
  Ingredients(title: 'Ham', useBy: DateTime.now()),
]);
final mockLoadPayload = Recipe();
final mockResponse = [FreezerResponse(title: 'Ham', useBy: DateTime.now())];

main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  late IngredientUsecase ingredientUsecase;
  late FilterIngredientUsecase filterIngredientUsecase;
  await Kiwi.setup();
  late RecipeBloc recipeBloc;
  late RecipeService recipeService;

  setUp(() {
    ingredientUsecase = MockIngredientUsecase();
    filterIngredientUsecase = MockFilterIngredientUsecase();
    recipeBloc = RecipeBloc(
      ingredientUsecase: Kiwi.inject<IngredientUsecase>(),
      filterIngredientUsecase: filterIngredientUsecase,
      recipeUsecase: Kiwi.inject<RecipeUsecase>(),
    );
    recipeService = MockRecipeService();
  });

  group('test recipe category', () {
    blocTest<RecipeBloc, RecipeState>(
      "should have empty initial state",
      build: () => recipeBloc,
      expect: () => [],
    );

    blocTest(
      'should fire loading state and error state when api call fails',
      build: () => recipeBloc,
      setUp: () {
        when(recipeService.getIngredients())
            .thenAnswer((_) async => mockResponse);
      },
      act: (recipeBloc) => recipeBloc.add(GetIngredientEvent()),
      expect: () => [
        LoadingState(mockLoadPayload),
        const ErrorState(Recipe(
            ingredient: null,
            errorMessage: 'Service unavailable, please try again later',
            date: null))
      ],
    );
  });
}
