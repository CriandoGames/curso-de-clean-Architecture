abstract class HttpService {
  Future<CustomHttpResponse> get(String url, {Map<String, String> headers});

  Future<CustomHttpResponse> post(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String> headers,
  });

  Future<CustomHttpResponse> put(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String> headers,
  });

  Future<CustomHttpResponse> delete(
    String url, {
    required Map<String, String> body,
    Map<String, String> headers,
  });

  Future<CustomHttpResponse> patch(
    String url, {
    required dynamic body,
    Map<String, String> headers,
  });

  Future<HttpService> getInstance();
}

class CustomHttpResponse {
  final bool success;
  final List<String> errors;
  final dynamic data;
  final int? statusCode;

  CustomHttpResponse(
      {required this.data,
      this.statusCode,
      this.success = true,
      this.errors = const []});

  CustomHttpResponse copyWith({
    bool? success,
    List<String>? errors,
    dynamic data,
    int? statusCode,
  }) {
    return CustomHttpResponse(
      success: success ?? this.success,
      errors: errors ?? this.errors,
      data: data ?? this.data,
      statusCode: statusCode ?? this.statusCode,
    );
  }
}