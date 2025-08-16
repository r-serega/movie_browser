abstract class ChangeFields {
  static const success = "success";
  static const statusCode = "status_code";
  static const statusMessage = "status_message";
}

class ChangeModel {
  final bool success;
  final int statusCode;
  final String statusMessage;

  ChangeModel({
    required this.success,
    required this.statusCode,
    required this.statusMessage,
  });

  factory ChangeModel.empty() {
    var model = ChangeModel(success: false, statusCode: 0, statusMessage: '');
    return model;
  }

  factory ChangeModel.fromJson(Map<String, dynamic> json) {
    return ChangeModel(
      success: json[ChangeFields.success],
      statusCode: json[ChangeFields.statusCode],
      statusMessage: json[ChangeFields.statusMessage],
    );
  }
}
