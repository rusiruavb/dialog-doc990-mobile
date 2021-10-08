class Doctor {
  String name;
  String specialization;
  String imageUrl;
  List<dynamic> notes = [];
  int appointments;
  List<AvailableDetails> availableDetails = [];

  Doctor({
    this.name,
    this.specialization,
    this.notes,
    this.appointments,
    this.availableDetails,
    this.imageUrl,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      specialization: json['specialization'],
      notes: json['notes'],
      availableDetails: (json['availableDetails'] as List)
              ?.map((value) => AvailableDetails.fromJson(value))
              ?.toList() ??
          [],
      appointments: json['appointments'],
      imageUrl: json['imageUrl'],
    );
  }
}

class AvailableDetails {
  final String hospitalName;
  final String dateTime;
  final int doctorCharge;

  AvailableDetails({
    this.hospitalName,
    this.dateTime,
    this.doctorCharge,
  });

  factory AvailableDetails.fromJson(Map<String, dynamic> json) {
    return AvailableDetails(
      hospitalName: json['hospitalName'],
      dateTime: json['dateTime'],
      doctorCharge: json['doctorCharge'],
    );
  }
}
