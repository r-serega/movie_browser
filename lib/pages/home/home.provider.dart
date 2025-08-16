import '../../app.dart';
import '../../providers/base.provider.dart';
import 'home.model.dart';

class HomeProvider extends BaseProvider {
  HomeProvider() : super() {
    baseUrl = "${baseUrl}movie/popular";
  }

  Future<HomeModel> getItem(int currentPage, String localeISO) async {
    Map<String, String>? headers = {'Authorization': 'Bearer ${App.config.bearer}', 'accept': 'application/json'};
    return response(() => get('?api_key=${App.config.apiKey}&language=$localeISO&page=$currentPage', headers: headers),
        (data) => HomeModel.fromJson(data));
  }
}
