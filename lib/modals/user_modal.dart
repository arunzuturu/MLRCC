// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModal {
  final String uid;
  final String name;
  final String email;
  final String phone;
  final String branch;
  final String year;
  final String rollno;
  final String semester;
  final String section;
  UserModal({
    required this.uid,
    required this.name,
    required this.email,
    required this.phone,
    required this.branch,
    required this.year,
    required this.rollno,
    required this.semester,
    required this.section,
  });

  UserModal copyWith({
    String? uid,
    String? name,
    String? email,
    String? phone,
    String? branch,
    String? year,
    String? rollno,
    String? semester,
    String? section,
  }) {
    return UserModal(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      branch: branch ?? this.branch,
      year: year ?? this.year,
      rollno: rollno ?? this.rollno,
      semester: semester ?? this.semester,
      section: section ?? this.section,
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
      'rollno': rollno,
      'semester': semester,
      'section': section,
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
      rollno: map['rollno'] as String,
      semester: map['semester'] as String,
      section: map['section'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModal.fromJson(String source) => UserModal.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModal(uid: $uid, name: $name, email: $email, phone: $phone, branch: $branch, year: $year, rollno: $rollno, semester: $semester, section: $section)';
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
      other.rollno == rollno &&
      other.semester == semester &&
      other.section == section;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      name.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      branch.hashCode ^
      year.hashCode ^
      rollno.hashCode ^
      semester.hashCode ^
      section.hashCode;
  }
}
