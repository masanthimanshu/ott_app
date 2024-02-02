import 'package:ott_app/firebase/database/get_data_service.dart';
import 'package:ott_app/model/content/content_model.dart';

class ContentController with GetDataService {
  Future<List<ContentModel>?> getData() async {
    final data = await getCollectionData("content");
    return data.isNotEmpty ? contentModel(data) : null;
  }
}
