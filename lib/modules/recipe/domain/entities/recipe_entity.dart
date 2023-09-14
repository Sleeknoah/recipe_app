class RecipeEntity {
  List<Recipes> recipeList;

  RecipeEntity({
    required this.recipeList,
  });
}

class Recipes {
  String title;
  List<String> ingredients;

  Recipes({
    required this.title,
    required this.ingredients,
  });
}
