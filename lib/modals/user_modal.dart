class UserModal {
  String? name;
  String? email;
  String? rno;
  String? uid;
  String? branch;
  int? semester;
  int? year;
  String? phone;
  String? section;
  String? imageUrl;

  UserModal(
      {this.name,
      this.email,
      this.rno,
      this.uid,
      this.branch,
      this.semester,
      this.year,
      this.phone,
      this.imageUrl,
      this.section});

  UserModal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    rno = json['rno'];
    uid = json['uid'];
    branch = json['branch'];
    semester = json['semester'];
    year = json['year'];
    phone = json['phone'];
    section = json['section'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['rno'] = this.rno;
    data['uid'] = this.uid;
    data['branch'] = this.branch;
    data['semester'] = this.semester;
    data['year'] = this.year;
    data['phone'] = this.phone;
    data['section'] = this.section;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
