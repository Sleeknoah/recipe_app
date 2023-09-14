class IngredientException implements Exception {
  final String message;
  final String status;

  IngredientException({
    required this.message,
    required this.status,
  });
  factory IngredientException.fromJson(dynamic json) {
    return IngredientException(
      status: json['status'],
      message: json['message'] ?? "",
    );
  }
}
