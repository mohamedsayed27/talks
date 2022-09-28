class UserDataModel {
  final int code;
  final String status;
  final String message;
  final DataModel data;

  const UserDataModel(
      {required this.code,
      required this.status,
      required this.message,
      required this.data});

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}

class DataModel {
  final String id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String photoUrl;
  final bool gender;
  final String createdAt;
  final List<String> profilePhotos;

  const DataModel({
    required this.id,
    required this.fullName,
    required this.createdAt,
    required this.gender,
    required this.photoUrl,
    required this.firstName,
    required this.lastName,
    required this.profilePhotos,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      fullName: json['fullName'],
      gender: json['gender'],
      firstName: json['firstName'],
      profilePhotos: json['profilePhotos'],
      lastName: json['lastName'],
      photoUrl: json['photoUrl'],
      createdAt: json['createdAt'],
    );
  }
}
