class UserAuthModel {
  UserAuthModel({
    this.userId,
    this.name,
    this.email,
    this.phoneNumber,
  });

  String userId;
  String name;
  String email;
  String phoneNumber;

  factory UserAuthModel.fromJson(Map<String, dynamic> json) => UserAuthModel(
        userId: json["user_id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
      };
}
