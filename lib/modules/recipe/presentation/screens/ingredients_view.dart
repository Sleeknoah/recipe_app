part of 'freezer_screen.dart';

class IngredientView extends StatelessWidget {
  const IngredientView({
    Key? key,
    required this.recipe,
    required this.date,
  }) : super(key: key);

  final Recipe recipe;
  final String date;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeBloc, RecipeState>(
      listener: (context, state) {
        if (state is RecipesState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RecipeScreen(
                recipe: state.recipe,
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      RecipeAppBar(
                        date: date,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MasonryGridView.builder(
                        gridDelegate:
                            const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        itemCount: recipe.ingredient?.length,
                        itemBuilder: (BuildContext context, int index) {
                          var ingredient = recipe.ingredient?[index];
                          return InkWell(
                            onTap: () {
                              if (ingredient.isValid!) {
                                context
                                    .read<IngredientCubit>()
                                    .addIngredient(ingredient.title);
                              }
                            },
                            child: IngredientCard(recipe: ingredient!),
                          );
                        },
                      ),
                      const SizedBox(height: 110),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: BlocBuilder<IngredientCubit, IngredientState>(
                      builder: (context, state) {
                    return BottomBar(count: state.ingredients.length);
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
