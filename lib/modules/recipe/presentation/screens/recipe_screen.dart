import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/modules/recipe/presentation/bloc/recipe_bloc.dart';
import 'package:recipe_app/modules/recipe/presentation/widgets/recipe_card.dart';

import '../../../../core/constants/app_colors.dart';

class RecipeScreen extends StatelessWidget {
  const RecipeScreen({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Recipe',
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.buttonColorSecondary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                context.read<RecipeBloc>().add(GetIngredientEvent());
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FaIcon(FontAwesomeIcons.arrowLeft),
              ),
            ),
          )),
      body: ListView.builder(
          itemCount: recipe.recipe?.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, item) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24.0,
              ),
              child: RecipeCard(
                title: recipe.recipe?[item].title ?? "",
                ingredients: recipe.recipe?[item].ingredients ?? [],
              ),
            );
          }),
    );
  }
}
