import 'package:dio/dio.dart';
import 'package:docdoc/Features/login/data/models/login_request_body.dart';
import 'package:docdoc/Features/login/data/models/login_response.dart';
import 'package:docdoc/core/networking/api_constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../Features/signup/data/models/signup_request_body.dart';
import '../../Features/signup/data/models/signup_response_model.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody loginRequestBody);
}
