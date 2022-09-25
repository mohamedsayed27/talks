
class UserDataModel{
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

class DataModel{
  final String id;
  final String fullName;
  final bool gender;
  const DataModel(
      {required this.id, required this.fullName, required this.gender});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      fullName: json['fullName'],
      gender: json['gender'],
    );
  }
}
