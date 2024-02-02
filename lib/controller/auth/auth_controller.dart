import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ott_app/firebase/database/get_data_service.dart';

final authStateNotifier = StateNotifierProvider<AuthController, String>(
  (ref) => AuthController("login"),
);

class AuthController extends StateNotifier<String> with GetDataService {
  AuthController(super.state);

  void checkUser(String phone) async {
    final res = await getFilteredData(
      collection: "users",
      field: "phone",
      value: phone,
    );

    res.isEmpty ? state = "signup" : state = "login";
  }

  void changeUserStage(String stage) => state = stage;
}
