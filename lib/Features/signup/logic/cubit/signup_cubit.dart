import 'package:docdoc/Features/signup/data/models/signup_request_body.dart';
import 'package:docdoc/Features/signup/data/repositories/signup_repo.dart';
import 'package:docdoc/Features/signup/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void emitSignUpState() async {
    emit(const SignupState.signUpLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
          email: emailController.text,
          password: passwordController.text,
          name: nameController.text,
          phone: phoneController.text,
          confirmPassword: confirmPasswordController.text,
          gender: 0),
    );
    response.when(
      success: (data) {
        emit(SignupState.signUpSuccess(data));
      },
      failure: (error) {
        emit(SignupState.signUpError(error.apiErrorModel.message ?? ''));
      },
    );
  }
}
