class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.gender,
    this.password,
    this.imageUrl,
    this.country,
    this.nic,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String email;
  String phoneNumber;
  String gender;
  String password;
  String imageUrl;
  String country;
  String nic;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        gender: json["gender"],
        password: json["password"],
        imageUrl: json["imageUrl"],
        country: json["country"],
        nic: json["nic"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "password": password,
        "imageUrl": imageUrl,
        "country": country,
        "nic": nic,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
