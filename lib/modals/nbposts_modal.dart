class NBPostsModal {
  String? title;
  String? description;
  String? hastag;
  String? link;
  String? createdAt;

  NBPostsModal(
      {this.title, this.description, this.hastag, this.link, this.createdAt});

  NBPostsModal.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    hastag = json['hastag'];
    link = json['link'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['hastag'] = hastag;
    data['link'] = link;
    data['createdAt'] = createdAt;
    return data;
  }
}
