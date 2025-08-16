abstract class SessionFields {
  static const success = "success";
  static const sessionId = "session_id";
}

class SessionModel {
  final bool success;
  final String sessionId;

  SessionModel({
    required this.success,
    required this.sessionId,
  });

  factory SessionModel.empty() {
    var model = SessionModel(success: false, sessionId: '');
    return model;
  }

  factory SessionModel.fromJson(Map<String, dynamic> json) {
    return SessionModel(
      success: json[SessionFields.success] ?? false,
      sessionId: json[SessionFields.sessionId] ?? '',
    );
  }
}