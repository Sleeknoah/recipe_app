class RecipeDto {
  List<Recipe> recipe;

  RecipeDto({
    required this.recipe,
  });
}

class Recipe {
  String title;
  List<String> ingredients;

  Recipe({
    required this.title,
    required this.ingredients,
  });
}
