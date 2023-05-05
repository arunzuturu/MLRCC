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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['hastag'] = this.hastag;
    data['link'] = this.link;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
