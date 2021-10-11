class RefundModel {
  RefundModel({
    this.isBankRefund,
    this.isMobileRefund,
    this.id,
    this.referenceNo,
    this.refundRemarks,
    this.phoneNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.bankName,
    this.branchName,
    this.refundAmount,
    this.v,
  });

  bool isBankRefund;
  bool isMobileRefund;
  String id;
  String referenceNo;
  String refundRemarks;
  String phoneNumber;
  String status;
  DateTime createdAt;
  String bankName;
  String branchName;
  DateTime updatedAt;
  int refundAmount;
  int v;

  factory RefundModel.fromJson(Map<String, dynamic> json) => RefundModel(
        isBankRefund: json["isBankRefund"],
        isMobileRefund: json["isMobileRefund"],
        id: json["_id"],
        referenceNo: json["referenceNo"],
        refundRemarks: json["refundRemarks"],
        phoneNumber: json["phoneNumber"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        bankName: json["bankName"],
        branchName: json["branchName"],
        refundAmount: json["amount"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "isBankRefund": isBankRefund,
        "isMobileRefund": isMobileRefund,
        "_id": id,
        "referenceNo": referenceNo,
        "refundRemarks": refundRemarks,
        "phoneNumber": phoneNumber,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "amount": refundAmount,
        "bankName": bankName,
        "branchName": branchName,
        "__v": v,
      };
}
