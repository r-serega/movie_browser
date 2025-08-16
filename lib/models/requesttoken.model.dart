abstract class RequestTokenFields {
  static const success = "success";
  static const expiresAt = "expires_at";
  static const requestToken = "request_token";
}

class RequestTokenModel {
  final bool success;
  final String expiresAt;
  final String requestToken;

  RequestTokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) {
    return RequestTokenModel(
      success: json[RequestTokenFields.success],
      expiresAt: json[RequestTokenFields.expiresAt],
      requestToken: json[RequestTokenFields.requestToken],
    );
  }
}

