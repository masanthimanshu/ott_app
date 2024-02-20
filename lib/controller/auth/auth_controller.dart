import 'package:ott_app/firebase/database/get_data_service.dart';

class AuthController with GetDataService {
  Future<String> checkUser(String uid) async {
    final data = await getFilteredData(
      collection: "users",
      field: "id",
      value: uid,
    );

    final res = data.isEmpty ? "signUp" : "login";
    return res;
  }
}
