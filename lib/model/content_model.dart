List<ContentModel> contentModel(data) {
  return List<ContentModel>.from(
    data.map((e) => ContentModel.fromJson(e)),
  );
}

class ContentModel {
  final String tag;
  final String desc;
  final String title;
  final String videoId;
  final String thumbnail;
  final String embedCode;
  final String paymentType;

  const ContentModel({
    required this.tag,
    required this.desc,
    required this.title,
    required this.videoId,
    required this.thumbnail,
    required this.embedCode,
    required this.paymentType,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      tag: json["tag"],
      desc: json["desc"],
      title: json["title"],
      videoId: json["videoId"],
      thumbnail: json["thumbnail"],
      embedCode: json["embedCode"],
      paymentType: json["paymentType"],
    );
  }
}
