class AttendanceModal {
  String? sId;
  String? rno;
  int? attendance;
  int? iV;

  AttendanceModal({this.sId, this.rno, this.attendance, this.iV});

  AttendanceModal.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    rno = json['rno'];
    attendance = json['attendance'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['rno'] = rno;
    data['attendance'] = attendance;
    data['__v'] = iV;
    return data;
  }
}
