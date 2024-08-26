import 'package:docdoc/Features/signup/data/models/signup_request_body.dart';
import 'package:docdoc/Features/signup/data/models/signup_response_model.dart';
import 'package:docdoc/core/networking/api_error_handler.dart';
import 'package:docdoc/core/networking/api_result.dart';
import 'package:docdoc/core/networking/api_service.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } 
    catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
