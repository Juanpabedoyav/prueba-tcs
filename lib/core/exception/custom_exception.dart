class CustomException implements Exception {
  final String? message;
  final dynamic error;
  final StackTrace? stackTrace;
  final String? userCode;
  final String? userMessage;
  final int? httpErrorCode;
  final String? response;
  final String? request;
  final String? url;

  CustomException({
    required this.message,
    this.error,
    this.stackTrace,
    this.response,
    this.request,
    this.url,
    this.userCode,
    this.userMessage,
    this.httpErrorCode,
  });
}
