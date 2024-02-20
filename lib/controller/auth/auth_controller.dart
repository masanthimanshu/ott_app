import 'package:firebase_auth/firebase_auth.dart';
import 'package:ott_app/firebase/database/get_data_service.dart';

class AuthController with GetDataService {
  final _user = FirebaseAuth.instance.currentUser!;

  Future<String> checkUser() async {
    final data = await getFilteredData(
      value: _user.phoneNumber!,
      collection: "users",
      field: "phone",
    );

    final res = data.isEmpty ? "signUp" : "login";
    return res;
  }
}
