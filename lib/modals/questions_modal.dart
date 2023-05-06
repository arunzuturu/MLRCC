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
        comments!.add(new Comments.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['question'] = this.question;
    data['id'] = this.id;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['username'] = this.username;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
