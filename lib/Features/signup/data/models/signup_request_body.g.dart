// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      confirmPassword: json['password_confirmation'] as String,
      gender: (json['gender'] as num).toInt(),
      email: json['email'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'password_confirmation': instance.confirmPassword,
      'gender': instance.gender,
    };
