class ServerResponse {
  String api_status;
  Object errors;

  ServerResponse({
    required this.errors,
    required this.api_status,
  });
}
