import 'package:get_it/get_it.dart';
import 'package:onboarding_winter_project/core/network/api_services.dart';
import 'package:onboarding_winter_project/core/network/dio_config.dart';
import 'package:onboarding_winter_project/features/auth/data/data_sources/remote/remote_data_source.dart';
import 'package:onboarding_winter_project/features/auth/data/repository/auth_repository_impl.dart';
import 'package:onboarding_winter_project/features/auth/domain/repository/auth_repository.dart';
import 'package:onboarding_winter_project/features/auth/domain/use_cases/login_use_case.dart';
import 'package:onboarding_winter_project/features/auth/presentation/provider/auth_provider.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton(() => ApiServices(DioConfig.getDio()));
  getIt.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSource(getIt()),
  );
  getIt.registerFactory<AuthRepository>(() => AuthRepositoryImpl(getIt()));
  getIt.registerFactory<LoginUseCase>(() => LoginUseCase(getIt()));
  getIt.registerFactory<AuthProvider>(() => AuthProvider(getIt()));
}
