
class ExploreModal {
  String? sId;
  String? photoUrl;
  String? name;
  String? imageLink;
  int? iV;

  ExploreModal({this.sId, this.photoUrl, this.name, this.imageLink, this.iV});

  ExploreModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    photoUrl = json['photoUrl'];
    name = json['name'];
    imageLink = json['imageLink'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['photoUrl'] = photoUrl;
    data['name'] = name;
    data['imageLink'] = imageLink;
    data['__v'] = iV;
    return data;
  }
}