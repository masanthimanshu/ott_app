List<ContentModel> contentModel(data) {
  return List<ContentModel>.from(
    data.map((e) => ContentModel.fromJson(e)),
  );
}

class ContentModel {
  final String type;
  final String desc;
  final bool isPaid;
  final String title;
  final String videoId;
  final String embedCode;
  final String thumbnail;
  final List<String> tag;
  final List<String> genre;

  const ContentModel({
    required this.tag,
    required this.desc,
    required this.type,
    required this.genre,
    required this.title,
    required this.isPaid,
    required this.videoId,
    required this.thumbnail,
    required this.embedCode,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      desc: json["desc"],
      title: json["title"],
      isPaid: json["isPaid"],
      videoId: json["videoId"],
      type: json["contentType"],
      thumbnail: json["thumbnail"],
      embedCode: json["embedCode"],
      tag: List<String>.from(json["tag"].map((x) => x)),
      genre: List<String>.from(json["genre"].map((x) => x)),
    );
  }
}
