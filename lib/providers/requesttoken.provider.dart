import '../app.dart';
import '../models/session.model.dart';
import 'base.provider.dart';
import '../models/requesttoken.model.dart';

class RequestTokenProvider extends BaseProvider {
  RequestTokenProvider() : super() {
    baseUrl = "${baseUrl}authentication";
  }

  Future<RequestTokenModel> getAuth() async {
    Map<String, String>? headers = {
      'Authorization':
          'Bearer ${App.config.bearer}',
      'accept': 'application/json'
    };
    return response(() => get('/token/new?api_key=${App.config.apiKey}', headers: headers),
        (data) => RequestTokenModel.fromJson(data));
  }

  Future<SessionModel> getSession(String requestToken) async {
    Map<String, String>? headers = {
      'Authorization':
          'Bearer ${App.config.bearer}',
      'Content-Type': 'application/json'
    };
    Map<String, String>? body = {"request_token": requestToken};
    return response(() => post('/session/new?api_key=${App.config.apiKey}', body, headers: headers),
        (data) => SessionModel.fromJson(data));
  }
}
