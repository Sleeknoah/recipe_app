class FreezerDto {
  List<Freezer> freezer;

  FreezerDto({
    required this.freezer,
  });
}

class Freezer {
  final String title;
  final DateTime useBy;

  Freezer({
    required this.title,
    required this.useBy,
  });
}
