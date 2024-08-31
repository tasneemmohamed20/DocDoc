import 'package:json_annotation/json_annotation.dart';
part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponse {
  String message;
  @JsonKey(name: 'data')
  UserData userData;
  bool status;
  int code;

  SignupResponse({
    required this.status,
    required this.message,
    required this.userData,
    required this.code,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String? token;
  @JsonKey(name: 'username')
  final String? userName;

  UserData({
    this.token,
    this.userName,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
