import 'package:weather_app/providers/response/header.dart';

class LoginResponseMain {
  _LoginResponseDT? loginResponseDT;
  _ClientTokenDT? clientTokenDT;
  Header header;

  LoginResponseMain({
    this.loginResponseDT,
    this.clientTokenDT,
    required this.header,
  });

  static LoginResponseMain parseFromJson(Map<String, dynamic> json) {
    return LoginResponseMain(
        loginResponseDT:
            _LoginResponseDT.fromJson(json["body"]["loginResponse"]),
        clientTokenDT: _ClientTokenDT.fromJson(json["body"]["clientTokenDT"]),
        header: Header.fromJson(json["header"]));
  }
}

class _LoginResponseDT {
  int? userId;
  String? firstName;
  String? lastName;
  String? profileImage;
  int? phoneNumber;
  String? email;
  String? password;
  String? address1;
  String? address2;
  String? city;
  String? country;
  String? latitude;
  String? longitude;
  String? deviceDesc;
  bool? isEmailVerified;
  bool? isNumberVerified;
  bool? status;
  int? profileRole;
  DateTime? entryDate;
  DateTime? lastModified;

  _LoginResponseDT({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
    required this.phoneNumber,
    required this.email,
    required this.password,
    required this.address1,
    required this.address2,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.deviceDesc,
    required this.isEmailVerified,
    required this.isNumberVerified,
    required this.status,
    required this.profileRole,
    required this.entryDate,
    required this.lastModified,
  });

  factory _LoginResponseDT.fromJson(Map<String, dynamic> json) =>
      _LoginResponseDT(
        userId: json["UserId"] ?? "",
        firstName: json["FirstName"] ?? "",
        lastName: json["LastName"] ?? "",
        profileImage: json["ProfileImage"] ?? "",
        phoneNumber: json["PhoneNumber"] ?? 0,
        email: json["Email"] ?? "",
        password: json["Password"] ?? "",
        address1: json["Address1"] ?? "",
        address2: json["Address2"] ?? "",
        city: json["City"] ?? "",
        country: json["Country"] ?? "",
        latitude: json["Latitude"] ?? "",
        longitude: json["Longitude"] ?? "",
        deviceDesc: json["DeviceDesc"] ?? "",
        isEmailVerified: json["IsEmailVerified"] ?? false,
        isNumberVerified: json["IsNumberVerified"] ?? false,
        status: json["Status"] ?? false,
        profileRole: json["ProfileRole"] ?? 0,
        entryDate: json["EntryDate"] as DateTime,
        lastModified: json["LastModified"] as DateTime,
      );
}

class _ClientTokenDT {
  var token;
  var dateExpiration;

  _ClientTokenDT({
    required this.token,
    required this.dateExpiration,
  });

  factory _ClientTokenDT.fromJson(Map<dynamic, dynamic> json) => _ClientTokenDT(
        token: json["token"],
        dateExpiration: json["dateExpiration"],
      );
}
