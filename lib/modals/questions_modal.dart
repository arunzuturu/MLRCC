class QuestionsModal {
  String? sId;
  String? question;
  String? id;
  List<Comments>? comments;
  String? createdAt;
  String? updatedAt;
  int? iV;

  QuestionsModal(
      {this.sId,
      this.question,
      this.id,
      this.comments,
      this.createdAt,
      this.updatedAt,
      this.iV});

  QuestionsModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    question = json['question'];
    id = json['id'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(Comments.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['question'] = question;
    data['id'] = id;
    if (comments != null) {
      data['comments'] = comments!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

class Comments {
  String? text;
  String? username;
  String? imageUrl;

  Comments({this.text, this.username, this.imageUrl});

  Comments.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    username = json['username'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['username'] = username;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
