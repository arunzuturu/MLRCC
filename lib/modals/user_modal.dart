// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModal {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String branch;
  final String year;
  final String rno;
  final String semester;
  final String section;
  final String imageUrl;
  UserModal({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.branch,
    required this.year,
    required this.rno,
    required this.semester,
    required this.section,
    required this.imageUrl,
  });

  UserModal copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? branch,
    String? year,
    String? rno,
    String? semester,
    String? section,
    String? imageUrl,
  }) {
    return UserModal(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      branch: branch ?? this.branch,
      year: year ?? this.year,
      rno: rno ?? this.rno,
      semester: semester ?? this.semester,
      section: section ?? this.section,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'branch': branch,
      'year': year,
      'rno': rno,
      'semester': semester,
      'section': section,
      'imageUrl': imageUrl,
    };
  }

  factory UserModal.fromMap(Map<String, dynamic> map) {
    return UserModal(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      branch: map['branch'] as String,
      year: map['year'] as String,
      rno: map['rno'] as String,
      semester: map['semester'] as String,
      section: map['section'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) => UserModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModal(uid: $uid, name: $name, email: $email, phone: $phone, branch: $branch, year: $year, rno: $rno, semester: $semester, section: $section, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant UserModal other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.name == name &&
      other.email == email &&
      other.phone == phone &&
      other.branch == branch &&
      other.year == year &&
      other.rno == rno &&
      other.semester == semester &&
      other.section == section &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      branch.hashCode ^
      year.hashCode ^
      rno.hashCode ^
      semester.hashCode ^
      section.hashCode ^
      imageUrl.hashCode;
  }
}
