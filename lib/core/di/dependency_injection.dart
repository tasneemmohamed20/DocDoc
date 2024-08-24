import 'package:dio/dio.dart';
import 'package:docdoc/Features/login/logic/cubit/login_cubit.dart';
import 'package:docdoc/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';
import '../../Features/login/data/repositories/login_repo.dart';
import '../networking/api_service.dart';


final getit = GetIt.instance;
Future <void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  // Registering the ApiService
  getit.registerFactory<ApiService>(() => ApiService(dio));
  // Registering the LoginRepo
  getit.registerFactory<LoginRepo>(() => LoginRepo(getit<ApiService>()));
  getit.registerFactory<LoginCubit>(() => LoginCubit(getit<LoginRepo>()));
}