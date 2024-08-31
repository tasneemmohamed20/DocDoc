import 'package:dio/dio.dart';
import 'package:docdoc/Features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';
import '../../Features/login/data/repositories/login_repo.dart';
import '../../Features/signup/data/repositories/signup_repo.dart';
import '../../Features/signup/logic/cubit/signup_cubit.dart';
import '../networking/api_service.dart';


final getit = GetIt.instance;
Future <void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  // Registering the ApiService
  getit.registerLazySingleton<Dio>(() => dio);
  getit.registerLazySingleton<ApiService>(() => ApiService(dio));
  // Registering the LoginRepo
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit<ApiService>()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit<LoginRepo>()));

  // Registering the SignupRepo
  getit.registerLazySingleton<SignupRepo>(() => SignupRepo(getit<ApiService>()));
  getit.registerFactory<SignupCubit>(() => SignupCubit(getit<SignupRepo>()));
}