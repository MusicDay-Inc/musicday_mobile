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
import 'package:google_sign_in/google_sign_in.dart' as _i18;
import 'package:injectable/injectable.dart' as _i2;
import 'package:musicday_mobile/auth/di/auth_module.dart' as _i21;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor.dart'
    as _i15;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor_impl.dart'
    as _i19;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart'
    as _i8;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor_impl.dart'
    as _i20;
import 'package:musicday_mobile/auth/network/auth_remote_service.dart' as _i16;
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart'
    as _i13;
import 'package:musicday_mobile/auth/repositories/auth_session_repository_impl.dart'
    as _i17;
import 'package:musicday_mobile/auth/ui/auth_container_bloc.dart' as _i12;
import 'package:musicday_mobile/auth/ui/intro/intro_screen_bloc.dart' as _i14;
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_bloc.dart'
    as _i7;
import 'package:musicday_mobile/core/logging/impl/logger_factory_impl.dart'
    as _i6;
import 'package:musicday_mobile/core/logging/logger_factory.dart' as _i5;
import 'package:musicday_mobile/core/network/di/network_module.dart' as _i22;
import 'package:musicday_mobile/core/storage/di/storage_module.dart' as _i23;
import 'package:musicday_mobile/core/validation/impl/name_validator.dart'
    as _i11;
import 'package:musicday_mobile/core/validation/validator.dart' as _i10;
import 'package:musicday_mobile/releases/ui/song_info/song_info_bloc.dart'
    as _i9;

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
  gh.factory<_i7.SignUpScreenBloc>(() => _i7.SignUpScreenBloc(
        loggerFactory: gh<_i5.LoggerFactory>(),
        signUpInteractor: gh<_i8.SignUpInteractor>(),
      ));
  gh.factoryParam<_i9.SongInfoBloc, String, dynamic>((
    songId,
    _,
  ) =>
      _i9.SongInfoBloc(
        songId: songId,
        loggerFactory: gh<_i5.LoggerFactory>(),
      ));
  gh.singleton<_i10.Validator<String>>(
    _i11.NameValidator(loggerFactory: gh<_i5.LoggerFactory>()),
    instanceName: 'nameValidator',
  );
  gh.factory<_i12.AuthContainerBloc>(() => _i12.AuthContainerBloc(
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i13.AuthSessionRepository>(),
      ));
  gh.factory<_i14.IntroScreenBloc>(() => _i14.IntroScreenBloc(
        loggerFactory: gh<_i5.LoggerFactory>(),
        googleSignInInteractor: gh<_i15.GoogleSignInInteractor>(),
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
      gh.factory<_i16.AuthRemoteService>(
          () => authModule.provideAuthRemoteService(gh<_i3.Dio>()));
      gh.singleton<_i13.AuthSessionRepository>(
        _i17.AuthSessionRepositoryImpl(
          loggerFactory: gh<_i5.LoggerFactory>(),
          flutterSecureStorage: gh<_i4.FlutterSecureStorage>(),
        ),
        dispose: (i) => i.dispose(),
      );
      gh.singleton<_i18.GoogleSignIn>(authModule.provideGoogleSignIn());
      gh.singleton<_i15.GoogleSignInInteractor>(_i19.GoogleSignInInteractorImpl(
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i13.AuthSessionRepository>(),
        authRemoteService: gh<_i16.AuthRemoteService>(),
        googleSignIn: gh<_i18.GoogleSignIn>(),
      ));
      gh.singleton<_i8.SignUpInteractor>(_i20.SignUpInteractorImpl(
        nicknameValidator:
            gh<_i10.Validator<String>>(instanceName: 'nameValidator'),
        usernameValidator:
            gh<_i10.Validator<String>>(instanceName: 'nameValidator'),
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i13.AuthSessionRepository>(),
        authRemoteService: gh<_i16.AuthRemoteService>(),
      ));
    },
  );
}

class _$AuthModule extends _i21.AuthModule {}

class _$NetworkModule extends _i22.NetworkModule {}

class _$StorageModule extends _i23.StorageModule {}
