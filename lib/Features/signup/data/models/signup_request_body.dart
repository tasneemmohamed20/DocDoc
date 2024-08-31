import 'package:json_annotation/json_annotation.dart';
part 'signup_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String confirmPassword;
  final int gender;

  SignupRequestBody({
    required this.name,
    required this.phone,
    required this.password,
    required this.confirmPassword,
    required this.gender,
    required this.email,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
