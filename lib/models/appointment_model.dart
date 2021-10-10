class AppointmentModel {
  AppointmentModel({
    this.isAppointmentCancelled,
    this.id,
    this.time,
    this.name,
    this.email,
    this.address,
    this.phoneNumber,
    this.nic,
    this.city,
    this.province,
    this.isChargeChecked,
    this.isPdfChecked,
    this.referenceNo,
    this.hospitalName,
    this.date,
    this.totalAmount,
    this.specialization,
    this.doctorName,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  bool isAppointmentCancelled;
  String id;
  String time;
  String name;
  String email;
  String address;
  String phoneNumber;
  String nic;
  String city;
  String province;
  bool isChargeChecked;
  bool isPdfChecked;
  String referenceNo;
  String hospitalName;
  DateTime date;
  int totalAmount;
  DateTime createdAt;
  DateTime updatedAt;
  String doctorName;
  String specialization;
  int v;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      AppointmentModel(
        isAppointmentCancelled: json["isAppointmentCancelled"],
        id: json["_id"],
        time: json["time"],
        name: json["name"],
        email: json["email"],
        address: json["address"],
        phoneNumber: json["phoneNumber"],
        nic: json["nic"],
        city: json["city"],
        province: json["province"],
        isChargeChecked: json["isChargeChecked"],
        isPdfChecked: json["isPDFChecked"],
        referenceNo: json["referenceNo"],
        hospitalName: json["hospitalName"],
        date: DateTime.parse(json["date"]),
        totalAmount: json["totalAmount"],
        specialization: json["specialization"],
        doctorName: json["doctorName"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "isAppointmentCancelled": isAppointmentCancelled,
        "_id": id,
        "time": time,
        "name": name,
        "email": email,
        "address": address,
        "phoneNumber": phoneNumber,
        "nic": nic,
        "city": city,
        "province": province,
        "isChargeChecked": isChargeChecked,
        "isPDFChecked": isPdfChecked,
        "referenceNo": referenceNo,
        "doctorName": doctorName,
        "hospitalName": hospitalName,
        "specialization": specialization,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "totalAmount": totalAmount,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
