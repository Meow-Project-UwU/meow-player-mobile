// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../common/network/api_client.dart' as _i633;
import '../../common/network/dio_provider.dart' as _i949;
import '../../common/network/interceptor/auth_interceptor.dart' as _i425;
import '../../common/network/interceptor/log_interceptor.dart' as _i792;
import '../../common/router/app_router.dart' as _i209;
import '../../feat/authen/signin/data/sign_in_repo_impl.dart' as _i777;
import '../../feat/authen/signin/repositories/sign_in_repo.dart' as _i673;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final dioProvider = _$DioProvider();
  gh.lazySingleton<_i425.AuthInterceptor>(() => _i425.AuthInterceptor());
  gh.lazySingleton<_i792.AppLogInterceptor>(() => _i792.AppLogInterceptor());
  gh.lazySingleton<_i209.AppRouter>(() => _i209.AppRouter());
  gh.lazySingleton<_i673.SignInRepo>(() => _i777.SignInRepoImpl());
  gh.lazySingleton<_i361.Dio>(
    () => dioProvider.dio(
      gh<_i425.AuthInterceptor>(),
      gh<_i792.AppLogInterceptor>(),
    ),
  );
  gh.lazySingleton<_i633.ApiClient>(() => _i633.ApiClient(gh<_i361.Dio>()));
  return getIt;
}

class _$DioProvider extends _i949.DioProvider {}
