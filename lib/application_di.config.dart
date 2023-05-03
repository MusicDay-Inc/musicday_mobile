// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:musicday_mobile/auth/di/auth_module.dart' as _i18;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor.dart'
    as _i10;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor_impl.dart'
    as _i15;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart'
    as _i16;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor_impl.dart'
    as _i17;
import 'package:musicday_mobile/auth/network/auth_remote_service.dart' as _i11;
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart'
    as _i12;
import 'package:musicday_mobile/auth/repositories/auth_session_repository_impl.dart'
    as _i13;
import 'package:musicday_mobile/auth/ui/intro/intro_screen_bloc.dart' as _i9;
import 'package:musicday_mobile/core/logging/impl/logger_factory_impl.dart'
    as _i6;
import 'package:musicday_mobile/core/logging/logger_factory.dart' as _i5;
import 'package:musicday_mobile/core/network/di/network_module.dart' as _i19;
import 'package:musicday_mobile/core/storage/di/storage_module.dart' as _i20;
import 'package:musicday_mobile/core/validation/impl/name_validator.dart'
    as _i8;
import 'package:musicday_mobile/core/validation/validator.dart' as _i7;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  final storageModule = _$StorageModule();
  gh.singleton<_i3.Dio>(networkModule.dio);
  gh.singleton<_i4.FlutterSecureStorage>(storageModule.flutterSecureStorage);
  gh.singleton<_i5.LoggerFactory>(_i6.LoggerFactoryImpl());
  gh.singleton<_i7.Validator<String>>(
    _i8.NameValidator(loggerFactory: gh<_i5.LoggerFactory>()),
    instanceName: 'nameValidator',
  );
  gh.factory<_i9.IntroScreenBloc>(() => _i9.IntroScreenBloc(
        loggerFactory: gh<_i5.LoggerFactory>(),
        googleSignInInteractor: gh<_i10.GoogleSignInInteractor>(),
      ));
  return getIt;
} // initializes the registration of auth-scope dependencies inside of GetIt

_i1.GetIt initAuthScope(
  _i1.GetIt getIt, {
  _i1.ScopeDisposeFunc? dispose,
}) {
  return _i2.GetItHelper(getIt).initScope(
    'auth',
    dispose: dispose,
    init: (_i2.GetItHelper gh) {
      final authModule = _$AuthModule();
      gh.factory<_i11.AuthRemoteService>(
          () => authModule.provideAuthRemoteService(gh<_i3.Dio>()));
      gh.singleton<_i12.AuthSessionRepository>(_i13.AuthSessionRepositoryImpl(
        loggerFactory: gh<_i5.LoggerFactory>(),
        flutterSecureStorage: gh<_i4.FlutterSecureStorage>(),
      ));
      gh.singleton<_i14.GoogleSignIn>(authModule.provideGoogleSignIn());
      gh.singleton<_i10.GoogleSignInInteractor>(_i15.GoogleSignInInteractorImpl(
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i12.AuthSessionRepository>(),
        authRemoteService: gh<_i11.AuthRemoteService>(),
        googleSignIn: gh<_i14.GoogleSignIn>(),
      ));
      gh.singleton<_i16.SignUpInteractor>(_i17.SignUpInteractorImpl(
        nicknameValidator:
            gh<_i7.Validator<String>>(instanceName: 'nameValidator'),
        usernameValidator:
            gh<_i7.Validator<String>>(instanceName: 'nameValidator'),
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i12.AuthSessionRepository>(),
        authRemoteService: gh<_i11.AuthRemoteService>(),
      ));
    },
  );
}

class _$AuthModule extends _i18.AuthModule {}

class _$NetworkModule extends _i19.NetworkModule {}

class _$StorageModule extends _i20.StorageModule {}