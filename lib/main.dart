import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/modules/recipe/domain/usecase/filter_ingredients_usecase.dart';
import 'package:recipe_app/modules/recipe/presentation/screens/freezer_screen.dart';

import 'di/generated.dart';
import 'modules/recipe/domain/usecase/get_ingredients_usecase.dart';
import 'modules/recipe/domain/usecase/get_recipe_usecase.dart';
import 'modules/recipe/presentation/bloc/cubit/ingredient_cubit.dart';
import 'modules/recipe/presentation/bloc/recipe_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  await Kiwi.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => RecipeBloc(
                  ingredientUsecase: Kiwi.inject<IngredientUsecase>(),
                  filterIngredientUsecase:
                      Kiwi.inject<FilterIngredientUsecase>(),
                  recipeUsecase: Kiwi.inject<RecipeUsecase>(),
                )),
        BlocProvider(create: (context) => IngredientCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const FreezerScreen(),
      ),
    );
  }
}
