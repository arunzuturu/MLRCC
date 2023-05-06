
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['photoUrl'] = this.photoUrl;
    data['name'] = this.name;
    data['imageLink'] = this.imageLink;
    data['__v'] = this.iV;
    return data;
  }
}