import 'package:uno/uno.dart';

import '../../../domain/contract/gateways/http_service.dart';

class HttpServiceUno implements HttpService {
  final Uno _client;

  HttpServiceUno({
    required Uno client,
  }) : _client = client;

  @override
  Future<HttpServiceUno> getInstance() async {
    return this;
  }

  @override
  Future<CustomHttpResponse> delete(
    String url, {
    Map<String, String> body = const {},
    Map<String, String> headers = const {},
  }) async {
    final response = await _client.delete(
      url,
      headers: headers,
      params: body,
    );
    final reponseConverted =
        CustomHttpResponse(data: response.data, statusCode: response.status);

    return reponseConverted;
  }

  @override
  Future<CustomHttpResponse> get(String url,
      {Map<String, String> headers = const {}}) async {
    final response = await _client.get(url, headers: headers);

    final reponseConverted =
        CustomHttpResponse(data: response.data, statusCode: response.status);

    return reponseConverted;
  }

  @override
  Future<CustomHttpResponse> patch(
    String url, {
    required body,
    Map<String, String> headers = const {},
  }) async {
    final response = await _client.patch(url, data: body, headers: headers);

    final reponseConverted =
        CustomHttpResponse(data: response.data, statusCode: response.status);

    return reponseConverted;
  }

  @override
  Future<CustomHttpResponse> post(
    String url, {
    required Map<String, dynamic> body,
    Map<String, String> headers = const {},
  }) async {
    final response = await _client.post(url, data: body, headers: headers);

    final reponseConverted =
        CustomHttpResponse(data: response.data, statusCode: response.status);

    return reponseConverted;
  }

  @override
  Future<CustomHttpResponse> put(
    String url, {
    dynamic body,
    Map<String, String> headers = const {},
  }) async {
    try {
      final response = await _client.put(url, data: body, headers: headers);

      final reponseConverted =
          CustomHttpResponse(data: response.data, statusCode: response.status);

      return reponseConverted;
    } catch (e) {
      return CustomHttpResponse(
        data: null,
        statusCode: 500,
        success: false,
        errors: ["Erro ao fazer requisição PUT $url", e.toString()],
      );
    }
  }
}
