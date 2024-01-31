import 'package:ott_app/firebase/database/get_data_service.dart';
import 'package:ott_app/model/content_model.dart';

class GetContentController with GetDataService {
  Future<List<ContentModel>?> getData() async {
    final data = await getCollectionData("content");
    return data != null ? contentModel(data) : null;
  }
}
