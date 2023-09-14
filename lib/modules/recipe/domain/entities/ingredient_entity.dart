class FreezerEntity {
  List<Ingredients> ingredientList;

  FreezerEntity({
    required this.ingredientList,
  });
}

class Ingredients {
  final String title;
  final DateTime useBy;
  final bool? isValid;

  Ingredients({
    required this.title,
    required this.useBy,
    this.isValid,
  });
}
