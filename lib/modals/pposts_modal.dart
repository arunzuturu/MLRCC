class PPostsModal {
  String? sId;
  String? title;
  String? uid;
  String? text;
  String? link;
  String? imageURL;
  String? createdAt;
  int? iV;

  PPostsModal(
      {this.sId,
      this.title,
      this.uid,
      this.text,
      this.link,
      this.imageURL,
      this.createdAt,
      this.iV});

  PPostsModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    uid = json['uid'];
    text = json['text'];
    link = json['link'];
    imageURL = json['imageURL'];
    createdAt = json['createdAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['uid'] = uid;
    data['text'] = text;
    data['link'] = link;
    data['imageURL'] = imageURL;
    data['createdAt'] = createdAt;
    data['__v'] = iV;
    return data;
  }
}