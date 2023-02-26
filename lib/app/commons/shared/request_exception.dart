class RequestException implements Exception {
  final String message;

  RequestException({required this.message});
}