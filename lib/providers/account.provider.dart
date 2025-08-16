import '../app.dart';
import '../models/account.model.dart';
import '../models/change.model.dart';
import '../pages/home/home.model.dart';
import 'base.provider.dart';

class AccountProvider extends BaseProvider {
  AccountProvider() : super() {
    baseUrl = "${baseUrl}account";
  }

  Future<AccountModel> getAccountId(String sessionId) async {
    Map<String, String>? headers = {
      'Authorization':
          'Bearer ${App.config.bearer}',
      'accept': 'application/json'
    };
    return response(() => get('?api_key=${App.config.apiKey}&session_id=$sessionId', headers: headers),
        (data) => AccountModel.fromJson(data));
  }

  Future<ChangeModel> changeFavorit(String accountId, String sessionId, int movieId) async {
    Map<String, String>? headers = {
      'Authorization':
          'Bearer ${App.config.bearer}',
      'Content-Type': 'application/json'
    };
    Map<String, dynamic>? body = {
      "media_type": "movie",
      "media_id": movieId,
      "favorite": true,
    };
    return response(
        () => post('/$accountId/favorite?api_key=${App.config.apiKey}&session_id=$sessionId', body, headers: headers),
        (data) => ChangeModel.fromJson(data));
  }

  Future<ChangeModel> changeNotFavorit(String accountId, String sessionId, int movieId) async {
    Map<String, String>? headers = {
      'Authorization':
          'Bearer ${App.config.bearer}',
      'Content-Type': 'application/json'
    };
    Map<String, dynamic>? body = {
      "media_type": "movie",
      "media_id": movieId,
      "favorite": false,
    };
    return response(
        () => post('/$accountId/favorite?api_key=${App.config.apiKey}&session_id=$sessionId', body, headers: headers),
        (data) => ChangeModel.fromJson(data));
  }

  Future<HomeModel> getFavoriteItem(String accountId, String sessionId, String localeISO) async {
    Map<String, String>? headers = {
      'Authorization':
          'Bearer ${App.config.bearer}',
      'accept': 'application/json'
    };
    return response(
        () => get('/$accountId/favorite/movies?api_key=${App.config.apiKey}&session_id=$sessionId&language=$localeISO',
            headers: headers),
        (data) => HomeModel.fromJson(data));
  }
}
