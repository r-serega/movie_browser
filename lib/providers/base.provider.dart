import 'package:get/get.dart';
import '/app.dart';

class BaseProvider extends GetConnect {
  BaseProvider() : super() {
    baseUrl = '${App.config.baseUrl}';
    allowAutoSignedCert = true; // the solution
  }

  
  Map<String, String> get headers {
    return {};
    // final token = App.auth.token; //получение токина
    // if (token == null) return {};
    // return {
    //   'Authorization': 'Bearer $token',
    // };
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    headers ??= {};
    return super
        .get<T>(url, headers: headers..addAll(this.headers), contentType: contentType, query: query, decoder: decoder);
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    headers ??= {};
    return super.post<T>(url, body,
        contentType: contentType,
        headers: headers..addAll(this.headers),
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
  }

  @override
  Future<Response<T>> put<T>(
    String url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    headers ??= {};
    return super.put<T>(url, body,
        contentType: contentType,
        headers: headers..addAll(this.headers),
        query: query,
        decoder: decoder,
        uploadProgress: uploadProgress);
  }

  @override
  Future<Response<T>> delete<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {
    headers ??= {};
    return super.delete<T>(url,
        contentType: contentType, headers: headers..addAll(this.headers), query: query, decoder: decoder);
  }

  Future<T> response<T, R>(Future<Response<R>> Function() request, T Function(dynamic) decoder) async {
    final response = await request();
    if (response.status.code == 403) {
    } else if (!response.status.isOk && response.status.code != 400) {
      Map<String, dynamic>? body;
      if (response.body is String) {
        body = {'message': response.body};
      } else {
        body = response.body as Map<String, dynamic>?;
      }
    }
    return decoder(response.body);
  }

  List<T> Function(dynamic) fromJsonList<T>(T Function(Map<String, dynamic>) fromJson) {
    return (dynamic list) {
      return (list as List).map<T>((i) => fromJson(i)).toList();
    };
  }

  int? asInt(dynamic value, [int? defaultInt]) {
    if (value is num) return value.toInt();
    if (value is String) return int.tryParse(value) ?? defaultInt;
    return defaultInt;
  }
}

class HttpResponseException {
  final int code;
  final String error;
  final String? message;

  const HttpResponseException(this.code, this.error, this.message);

  @override
  String toString() {
    return message ?? error;
  }
}
