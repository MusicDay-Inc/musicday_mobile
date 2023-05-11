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
import 'package:google_sign_in/google_sign_in.dart' as _i21;
import 'package:injectable/injectable.dart' as _i2;
import 'package:musicday_mobile/auth/di/auth_module.dart' as _i26;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor.dart'
    as _i18;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor_impl.dart'
    as _i22;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart'
    as _i9;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor_impl.dart'
    as _i23;
import 'package:musicday_mobile/auth/network/auth_remote_service.dart' as _i19;
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart'
    as _i16;
import 'package:musicday_mobile/auth/repositories/auth_session_repository_impl.dart'
    as _i20;
import 'package:musicday_mobile/auth/ui/auth_container_bloc.dart' as _i15;
import 'package:musicday_mobile/auth/ui/intro/intro_screen_bloc.dart' as _i17;
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_bloc.dart'
    as _i8;
import 'package:musicday_mobile/core/logging/impl/logger_factory_impl.dart'
    as _i6;
import 'package:musicday_mobile/core/logging/logger_factory.dart' as _i5;
import 'package:musicday_mobile/core/network/di/network_module.dart' as _i27;
import 'package:musicday_mobile/core/paging/di/paging_module.dart' as _i30;
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart'
    as _i7;
import 'package:musicday_mobile/core/storage/di/storage_module.dart' as _i28;
import 'package:musicday_mobile/core/validation/impl/name_validator.dart'
    as _i13;
import 'package:musicday_mobile/core/validation/validator.dart' as _i12;
import 'package:musicday_mobile/releases/di/releases_module.dart' as _i29;
import 'package:musicday_mobile/releases/network/releases_remote_service.dart'
    as _i24;
import 'package:musicday_mobile/releases/repositories/releases_repository.dart'
    as _i11;
import 'package:musicday_mobile/releases/repositories/releases_repository_impl.dart'
    as _i25;
import 'package:musicday_mobile/releases/ui/song_info/song_info_bloc.dart'
    as _i10;
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_bloc.dart'
    as _i14;

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
  final pagingModule = _$PagingModule();
  gh.singleton<_i3.Dio>(networkModule.dio);
  gh.singleton<_i4.FlutterSecureStorage>(storageModule.flutterSecureStorage);
  gh.singleton<_i5.LoggerFactory>(_i6.LoggerFactoryImpl());
  gh.singleton<_i7.PagedResponseFactory>(
      pagingModule.providePagedResponseFactory(gh<_i5.LoggerFactory>()));
  gh.factory<_i8.SignUpScreenBloc>(() => _i8.SignUpScreenBloc(
        loggerFactory: gh<_i5.LoggerFactory>(),
        signUpInteractor: gh<_i9.SignUpInteractor>(),
      ));
  gh.factoryParam<_i10.SongInfoBloc, String, bool>((
    songId,
    isSong,
  ) =>
      _i10.SongInfoBloc(
        songId: songId,
        isSong: isSong,
        releasesRepository: gh<_i11.ReleasesRepository>(),
        loggerFactory: gh<_i5.LoggerFactory>(),
      ));
  gh.singleton<_i12.Validator<String>>(
    _i13.NameValidator(loggerFactory: gh<_i5.LoggerFactory>()),
    instanceName: 'nameValidator',
  );
  gh.factoryParam<_i14.WriteReviewDialogBloc, String, dynamic>((
    id,
    _,
  ) =>
      _i14.WriteReviewDialogBloc(
        id: id,
        loggerFactory: gh<_i5.LoggerFactory>(),
        releasesRepository: gh<_i11.ReleasesRepository>(),
      ));
  gh.factory<_i15.AuthContainerBloc>(() => _i15.AuthContainerBloc(
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i16.AuthSessionRepository>(),
      ));
  gh.factory<_i17.IntroScreenBloc>(() => _i17.IntroScreenBloc(
        loggerFactory: gh<_i5.LoggerFactory>(),
        googleSignInInteractor: gh<_i18.GoogleSignInInteractor>(),
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
      gh.singleton<_i19.AuthRemoteService>(
          authModule.provideAuthRemoteService(gh<_i3.Dio>()));
      gh.singleton<_i16.AuthSessionRepository>(
        _i20.AuthSessionRepositoryImpl(
          loggerFactory: gh<_i5.LoggerFactory>(),
          flutterSecureStorage: gh<_i4.FlutterSecureStorage>(),
        ),
        dispose: (i) => i.dispose(),
      );
      gh.singleton<_i3.Dio>(
        authModule.provideDio(
          gh<_i16.AuthSessionRepository>(),
          gh<_i5.LoggerFactory>(),
        ),
        instanceName: 'authorizedDio',
      );
      gh.singleton<_i21.GoogleSignIn>(authModule.provideGoogleSignIn());
      gh.singleton<_i18.GoogleSignInInteractor>(_i22.GoogleSignInInteractorImpl(
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i16.AuthSessionRepository>(),
        authRemoteService: gh<_i19.AuthRemoteService>(),
        googleSignIn: gh<_i21.GoogleSignIn>(),
      ));
      gh.singleton<_i9.SignUpInteractor>(_i23.SignUpInteractorImpl(
        nicknameValidator:
            gh<_i12.Validator<String>>(instanceName: 'nameValidator'),
        usernameValidator:
            gh<_i12.Validator<String>>(instanceName: 'nameValidator'),
        loggerFactory: gh<_i5.LoggerFactory>(),
        authSessionRepository: gh<_i16.AuthSessionRepository>(),
        authRemoteService: gh<_i19.AuthRemoteService>(),
      ));
    },
  );
} // initializes the registration of releases-scope dependencies inside of GetIt

_i1.GetIt initReleasesScope(
  _i1.GetIt getIt, {
  _i1.ScopeDisposeFunc? dispose,
}) {
  return _i2.GetItHelper(getIt).initScope(
    'releases',
    dispose: dispose,
    init: (_i2.GetItHelper gh) {
      final releasesModule = _$ReleasesModule();
      gh.singleton<_i24.ReleasesRemoteService>(
          releasesModule.provideReleasesRemoteService(
              gh<_i3.Dio>(instanceName: 'authorizedDio')));
      gh.singleton<_i11.ReleasesRepository>(
        _i25.ReleasesRepositoryImpl(
          releasesRemoteService: gh<_i24.ReleasesRemoteService>(),
          loggerFactory: gh<_i5.LoggerFactory>(),
        ),
        dispose: (i) => i.dispose(),
      );
    },
  );
}

class _$AuthModule extends _i26.AuthModule {}

class _$NetworkModule extends _i27.NetworkModule {}

class _$StorageModule extends _i28.StorageModule {}

class _$ReleasesModule extends _i29.ReleasesModule {}

class _$PagingModule extends _i30.PagingModule {}
