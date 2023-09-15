import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/cubit/ingredient_cubit.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/recipe_bloc.dart';

import 'get_recipe_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key, required this.count}) : super(key: key);
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          // Shadow for top-left corner
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 20),
            blurRadius: 50,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      final ingredients =
                          context.read<IngredientCubit>().state.ingredients;
                      if (ingredients.isNotEmpty) {
                        context
                            .read<RecipeBloc>()
                            .add(GetRecipeEvent(ingredients.join(',')));
                      }
                    },
                    child: RecipeButton(count: count),
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
