import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/home/home_cubit.dart';
import '../repository/home_repository.dart';
import '../repository/retrofit/api_client.dart';
import '../repository/retrofit/dio_client.dart';
import '../theme/app_theme.dart';

GetIt sl = GetIt.instance;

Future setupLocator() async {
  sl.registerSingleton(AppTheme());

  sl.registerSingleton(DioClient.getInstance());

  sl.registerSingleton(ApiClient(sl()));

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerSingleton(HomeRepository(sl()));

  sl.registerFactory(
    () => HomeCubit(sl()),
  );
}
