// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:convert' as _i3;

import 'package:dio/dio.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i25;
import 'package:injectable/injectable.dart' as _i2;
import 'package:musicday_mobile/auth/di/auth_module.dart' as _i34;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor.dart'
    as _i22;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor_impl.dart'
    as _i26;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart'
    as _i13;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor_impl.dart'
    as _i27;
import 'package:musicday_mobile/auth/network/auth_remote_service.dart' as _i23;
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart'
    as _i20;
import 'package:musicday_mobile/auth/repositories/auth_session_repository_impl.dart'
    as _i24;
import 'package:musicday_mobile/auth/ui/auth_container_bloc.dart' as _i19;
import 'package:musicday_mobile/auth/ui/intro/intro_screen_bloc.dart' as _i21;
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_bloc.dart'
    as _i12;
import 'package:musicday_mobile/core/logging/impl/logger_factory_impl.dart'
    as _i10;
import 'package:musicday_mobile/core/logging/logger_factory.dart' as _i9;
import 'package:musicday_mobile/core/network/di/network_module.dart' as _i35;
import 'package:musicday_mobile/core/paging/di/paging_module.dart' as _i37;
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart'
    as _i11;
import 'package:musicday_mobile/core/storage/di/storage_module.dart' as _i36;
import 'package:musicday_mobile/core/validation/impl/name_validator.dart'
    as _i17;
import 'package:musicday_mobile/core/validation/validator.dart' as _i16;
import 'package:musicday_mobile/profiles/converters/user_dto_converter.dart'
    as _i6;
import 'package:musicday_mobile/profiles/di/profiles_module.dart' as _i39;
import 'package:musicday_mobile/profiles/dtos/user_dto.dart' as _i4;
import 'package:musicday_mobile/profiles/models/user.dart' as _i5;
import 'package:musicday_mobile/profiles/network/users_remote_service.dart'
    as _i30;
import 'package:musicday_mobile/profiles/repositories/users_repository.dart'
    as _i31;
import 'package:musicday_mobile/profiles/repositories/users_repository_impl.dart'
    as _i32;
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_bloc.dart'
    as _i33;
import 'package:musicday_mobile/releases/di/releases_module.dart' as _i38;
import 'package:musicday_mobile/releases/network/releases_remote_service.dart'
    as _i28;
import 'package:musicday_mobile/releases/repositories/releases_repository.dart'
    as _i15;
import 'package:musicday_mobile/releases/repositories/releases_repository_impl.dart'
    as _i29;
import 'package:musicday_mobile/releases/ui/song_info/song_info_bloc.dart'
    as _i14;
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_bloc.dart'
    as _i18;

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
  gh.singleton<_i3.Converter<_i4.UserDto, _i5.User>>(_i6.UserDtoConverter());
  gh.singleton<_i7.Dio>(networkModule.dio);
  gh.singleton<_i8.FlutterSecureStorage>(storageModule.flutterSecureStorage);
  gh.singleton<_i9.LoggerFactory>(_i10.LoggerFactoryImpl());
  gh.singleton<_i11.PagedResponseFactory>(
      pagingModule.providePagedResponseFactory(gh<_i9.LoggerFactory>()));
  gh.factory<_i12.SignUpScreenBloc>(() => _i12.SignUpScreenBloc(
        loggerFactory: gh<_i9.LoggerFactory>(),
        signUpInteractor: gh<_i13.SignUpInteractor>(),
      ));
  gh.factoryParam<_i14.SongInfoBloc, String, bool>((
    songId,
    isSong,
  ) =>
      _i14.SongInfoBloc(
        songId: songId,
        isSong: isSong,
        releasesRepository: gh<_i15.ReleasesRepository>(),
        loggerFactory: gh<_i9.LoggerFactory>(),
      ));
  gh.singleton<_i16.Validator<String>>(
    _i17.NameValidator(loggerFactory: gh<_i9.LoggerFactory>()),
    instanceName: 'nameValidator',
  );
  gh.factoryParam<_i18.WriteReviewDialogBloc, String, dynamic>((
    id,
    _,
  ) =>
      _i18.WriteReviewDialogBloc(
        id: id,
        loggerFactory: gh<_i9.LoggerFactory>(),
        releasesRepository: gh<_i15.ReleasesRepository>(),
      ));
  gh.factory<_i19.AuthContainerBloc>(() => _i19.AuthContainerBloc(
        loggerFactory: gh<_i9.LoggerFactory>(),
        authSessionRepository: gh<_i20.AuthSessionRepository>(),
      ));
  gh.factory<_i21.IntroScreenBloc>(() => _i21.IntroScreenBloc(
        loggerFactory: gh<_i9.LoggerFactory>(),
        googleSignInInteractor: gh<_i22.GoogleSignInInteractor>(),
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
      gh.singleton<_i23.AuthRemoteService>(
          authModule.provideAuthRemoteService(gh<_i7.Dio>()));
      gh.singleton<_i20.AuthSessionRepository>(
        _i24.AuthSessionRepositoryImpl(
          loggerFactory: gh<_i9.LoggerFactory>(),
          flutterSecureStorage: gh<_i8.FlutterSecureStorage>(),
        ),
        dispose: (i) => i.dispose(),
      );
      gh.singleton<_i7.Dio>(
        authModule.provideDio(
          gh<_i20.AuthSessionRepository>(),
          gh<_i9.LoggerFactory>(),
        ),
        instanceName: 'authorizedDio',
      );
      gh.singleton<_i25.GoogleSignIn>(authModule.provideGoogleSignIn());
      gh.singleton<_i22.GoogleSignInInteractor>(_i26.GoogleSignInInteractorImpl(
        loggerFactory: gh<_i9.LoggerFactory>(),
        authSessionRepository: gh<_i20.AuthSessionRepository>(),
        authRemoteService: gh<_i23.AuthRemoteService>(),
        googleSignIn: gh<_i25.GoogleSignIn>(),
      ));
      gh.singleton<_i13.SignUpInteractor>(_i27.SignUpInteractorImpl(
        nicknameValidator:
            gh<_i16.Validator<String>>(instanceName: 'nameValidator'),
        usernameValidator:
            gh<_i16.Validator<String>>(instanceName: 'nameValidator'),
        loggerFactory: gh<_i9.LoggerFactory>(),
        authSessionRepository: gh<_i20.AuthSessionRepository>(),
        authRemoteService: gh<_i23.AuthRemoteService>(),
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
      gh.singleton<_i28.ReleasesRemoteService>(
          releasesModule.provideReleasesRemoteService(
              gh<_i7.Dio>(instanceName: 'authorizedDio')));
      gh.singleton<_i15.ReleasesRepository>(
        _i29.ReleasesRepositoryImpl(
          releasesRemoteService: gh<_i28.ReleasesRemoteService>(),
          pagedResponseFactory: gh<_i11.PagedResponseFactory>(),
          userDtoConverter: gh<_i3.Converter<_i4.UserDto, _i5.User>>(),
          loggerFactory: gh<_i9.LoggerFactory>(),
        ),
        dispose: (i) => i.dispose(),
      );
    },
  );
} // initializes the registration of profile-scope dependencies inside of GetIt

_i1.GetIt initProfileScope(
  _i1.GetIt getIt, {
  _i1.ScopeDisposeFunc? dispose,
}) {
  return _i2.GetItHelper(getIt).initScope(
    'profile',
    dispose: dispose,
    init: (_i2.GetItHelper gh) {
      final profilesModule = _$ProfilesModule();
      gh.singleton<_i30.UsersRemoteService>(
          profilesModule.provideUsersRemoteService(
              gh<_i7.Dio>(instanceName: 'authorizedDio')));
      gh.singleton<_i31.UsersRepository>(
        _i32.UsersRepositoryImpl(
          loggerFactory: gh<_i9.LoggerFactory>(),
          pagedResponseFactory: gh<_i11.PagedResponseFactory>(),
          usersRemoteService: gh<_i30.UsersRemoteService>(),
          userDtoConverter: gh<_i3.Converter<_i4.UserDto, _i5.User>>(),
        ),
        dispose: (i) => i.dispose(),
      );
      gh.factoryParam<_i33.ProfileInfoBloc, String?, dynamic>((
        userId,
        _,
      ) =>
          _i33.ProfileInfoBloc(
            userId: userId,
            authSessionRepository: gh<_i20.AuthSessionRepository>(),
            usersRepository: gh<_i31.UsersRepository>(),
            loggerFactory: gh<_i9.LoggerFactory>(),
          ));
    },
  );
}

class _$AuthModule extends _i34.AuthModule {}

class _$NetworkModule extends _i35.NetworkModule {}

class _$StorageModule extends _i36.StorageModule {}

class _$PagingModule extends _i37.PagingModule {}

class _$ReleasesModule extends _i38.ReleasesModule {}

class _$ProfilesModule extends _i39.ProfilesModule {}
