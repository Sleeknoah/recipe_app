class ErrorResponse {
  final String status;
  final String title;
  final String message;

  ErrorResponse(
      {required this.status, required this.title, required this.message});

  factory ErrorResponse.fromJson(dynamic json) {
    return ErrorResponse(
      status: json['status'].toString(),
      title: json['title'] ?? "",
      message: json['message'] ?? "",
    );
  }

  factory ErrorResponse.generic(String error) {
    return ErrorResponse(
      status: 'error',
      title: 'Error',
      message: error,
    );
  }

  factory ErrorResponse.dataSerialization() {
    return ErrorResponse(
      status: 'error',
      title: 'Error',
      message: 'Service Unavailable : Data Serialization Error',
    );
  }
}
