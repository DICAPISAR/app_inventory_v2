import 'package:app_inventory/services/constans.dart';
import 'package:app_inventory/services/dto/request/login_request.dart';
import 'package:app_inventory/services/dto/response/login_response.dart';
import 'package:app_inventory/services/external/api_call.service.dart';
import 'package:http/http.dart';

class SessionService {
  dynamic getInfoUser(String key) {
    dynamic dataUser = Constants.userLoginInfo[key];

    if (dataUser == null) {
      return null;
    }

    return dataUser;
  }

  Future<bool> login(LoginRequest login) async {
    LoginResponse? loginResponse = await _doLogin(login);

    if (loginResponse != null) {
      Constants.userLoginInfo["id"] = loginResponse.id;
      Constants.userLoginInfo["name"] = loginResponse.name;
      Constants.userLoginInfo["rolId"] = loginResponse.rolId;
      Constants.userLoginInfo["rolName"] = loginResponse.rolName;
      Constants.userLoginInfo["idSession"] = loginResponse.idSession;
      return true;
    }

    return false;
  }

  Future<LoginResponse?> _doLogin(LoginRequest login) async {
    Uri uri = Uri.http(Constants.urlBase, Constants.urlLogin);

    Response response = await ApiService.post(uri, login.toJson());

    if (response.statusCode != 200) {
      return null;
    }

    var decodeResponse = ApiService.decodeResponse(response);

    LoginResponse loginResponse = LoginResponse.fromJson(decodeResponse);

    return loginResponse;
  }
}
