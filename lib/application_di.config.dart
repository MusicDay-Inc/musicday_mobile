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
import 'package:google_sign_in/google_sign_in.dart' as _i9;
import 'package:injectable/injectable.dart' as _i2;
import 'package:musicday_mobile/auth/di/auth_module.dart' as _i35;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor.dart'
    as _i17;
import 'package:musicday_mobile/auth/interactors/google_sign_in_interactor_impl.dart'
    as _i18;
import 'package:musicday_mobile/auth/interactors/google_sign_out_interactor.dart'
    as _i19;
import 'package:musicday_mobile/auth/interactors/google_sign_out_interactor_impl.dart'
    as _i20;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor.dart'
    as _i22;
import 'package:musicday_mobile/auth/interactors/sign_up_interactor_impl.dart'
    as _i23;
import 'package:musicday_mobile/auth/network/auth_remote_service.dart' as _i14;
import 'package:musicday_mobile/auth/repositories/auth_session_repository.dart'
    as _i15;
import 'package:musicday_mobile/auth/repositories/auth_session_repository_impl.dart'
    as _i16;
import 'package:musicday_mobile/auth/ui/auth_container_bloc.dart' as _i25;
import 'package:musicday_mobile/auth/ui/intro/intro_screen_bloc.dart' as _i21;
import 'package:musicday_mobile/auth/ui/sign_up/sign_up_screen_bloc.dart'
    as _i24;
import 'package:musicday_mobile/core/logging/impl/logger_factory_impl.dart'
    as _i11;
import 'package:musicday_mobile/core/logging/logger_factory.dart' as _i10;
import 'package:musicday_mobile/core/network/di/network_module.dart' as _i36;
import 'package:musicday_mobile/core/paging/di/paging_module.dart' as _i38;
import 'package:musicday_mobile/core/paging/factory/paged_response_factory.dart'
    as _i12;
import 'package:musicday_mobile/core/storage/di/storage_module.dart' as _i37;
import 'package:musicday_mobile/core/validation/di/validators_module.dart'
    as _i41;
import 'package:musicday_mobile/core/validation/validator.dart' as _i13;
import 'package:musicday_mobile/profiles/converters/user_dto_converter.dart'
    as _i6;
import 'package:musicday_mobile/profiles/di/profiles_module.dart' as _i40;
import 'package:musicday_mobile/profiles/dtos/user_dto.dart' as _i4;
import 'package:musicday_mobile/profiles/models/user.dart' as _i5;
import 'package:musicday_mobile/profiles/network/users_remote_service.dart'
    as _i30;
import 'package:musicday_mobile/profiles/repositories/users_repository.dart'
    as _i31;
import 'package:musicday_mobile/profiles/repositories/users_repository_impl.dart'
    as _i32;
import 'package:musicday_mobile/profiles/ui/profile_info/profile_info_bloc.dart'
    as _i34;
import 'package:musicday_mobile/releases/di/releases_module.dart' as _i39;
import 'package:musicday_mobile/releases/network/releases_remote_service.dart'
    as _i26;
import 'package:musicday_mobile/releases/repositories/releases_repository.dart'
    as _i27;
import 'package:musicday_mobile/releases/repositories/releases_repository_impl.dart'
    as _i28;
import 'package:musicday_mobile/releases/ui/song_info/song_info_bloc.dart'
    as _i29;
import 'package:musicday_mobile/releases/ui/write_review/write_review_dialog_bloc.dart'
    as _i33;

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
  final authModule = _$AuthModule();
  final pagingModule = _$PagingModule();
  final validatorsModule = _$ValidatorsModule();
  final releasesModule = _$ReleasesModule();
  final profilesModule = _$ProfilesModule();
  gh.singleton<_i3.Converter<_i4.UserDto, _i5.User>>(_i6.UserDtoConverter());
  gh.singleton<_i7.Dio>(networkModule.dio);
  gh.singleton<_i8.FlutterSecureStorage>(storageModule.flutterSecureStorage);
  gh.singleton<_i9.GoogleSignIn>(authModule.provideGoogleSignIn());
  gh.singleton<_i10.LoggerFactory>(_i11.LoggerFactoryImpl());
  gh.singleton<_i12.PagedResponseFactory>(
      pagingModule.providePagedResponseFactory(gh<_i10.LoggerFactory>()));
  gh.singleton<_i13.Validator<String>>(
    validatorsModule.provideUsernameValidator(gh<_i10.LoggerFactory>()),
    instanceName: 'usernameValidator',
  );
  gh.singleton<_i13.Validator<String>>(
    validatorsModule.provideNicknameValidator(gh<_i10.LoggerFactory>()),
    instanceName: 'nicknameValidator',
  );
  gh.singleton<_i14.AuthRemoteService>(
      authModule.provideAuthRemoteService(gh<_i7.Dio>()));
  gh.singleton<_i15.AuthSessionRepository>(
    _i16.AuthSessionRepositoryImpl(
      loggerFactory: gh<_i10.LoggerFactory>(),
      flutterSecureStorage: gh<_i8.FlutterSecureStorage>(),
    ),
    dispose: (i) => i.dispose(),
  );
  gh.singleton<_i17.GoogleSignInInteractor>(_i18.GoogleSignInInteractorImpl(
    loggerFactory: gh<_i10.LoggerFactory>(),
    authSessionRepository: gh<_i15.AuthSessionRepository>(),
    authRemoteService: gh<_i14.AuthRemoteService>(),
    googleSignIn: gh<_i9.GoogleSignIn>(),
  ));
  gh.singleton<_i19.GoogleSignOutInteractor>(_i20.GoogleSignOutInteractorImpl(
    authSessionRepository: gh<_i15.AuthSessionRepository>(),
    googleSignIn: gh<_i9.GoogleSignIn>(),
    loggerFactory: gh<_i10.LoggerFactory>(),
  ));
  gh.factory<_i21.IntroScreenBloc>(() => _i21.IntroScreenBloc(
        loggerFactory: gh<_i10.LoggerFactory>(),
        googleSignInInteractor: gh<_i17.GoogleSignInInteractor>(),
      ));
  gh.singleton<_i22.SignUpInteractor>(_i23.SignUpInteractorImpl(
    nicknameValidator:
        gh<_i13.Validator<String>>(instanceName: 'nicknameValidator'),
    usernameValidator:
        gh<_i13.Validator<String>>(instanceName: 'usernameValidator'),
    loggerFactory: gh<_i10.LoggerFactory>(),
    authSessionRepository: gh<_i15.AuthSessionRepository>(),
    authRemoteService: gh<_i14.AuthRemoteService>(),
  ));
  gh.factory<_i24.SignUpScreenBloc>(() => _i24.SignUpScreenBloc(
        loggerFactory: gh<_i10.LoggerFactory>(),
        signUpInteractor: gh<_i22.SignUpInteractor>(),
      ));
  gh.factory<_i25.AuthContainerBloc>(() => _i25.AuthContainerBloc(
        loggerFactory: gh<_i10.LoggerFactory>(),
        googleSignOutInteractor: gh<_i19.GoogleSignOutInteractor>(),
        authSessionRepository: gh<_i15.AuthSessionRepository>(),
      ));
  gh.singleton<_i7.Dio>(
    authModule.provideDio(
      gh<_i15.AuthSessionRepository>(),
      gh<_i10.LoggerFactory>(),
      gh<_i19.GoogleSignOutInteractor>(),
    ),
    instanceName: 'authorizedDio',
  );
  gh.singleton<_i26.ReleasesRemoteService>(
      releasesModule.provideReleasesRemoteService(
          gh<_i7.Dio>(instanceName: 'authorizedDio')));
  gh.singleton<_i27.ReleasesRepository>(
    _i28.ReleasesRepositoryImpl(
      releasesRemoteService: gh<_i26.ReleasesRemoteService>(),
      pagedResponseFactory: gh<_i12.PagedResponseFactory>(),
      userDtoConverter: gh<_i3.Converter<_i4.UserDto, _i5.User>>(),
      loggerFactory: gh<_i10.LoggerFactory>(),
    ),
    dispose: (i) => i.dispose(),
  );
  gh.factoryParam<_i29.SongInfoBloc, String, bool>((
    songId,
    isSong,
  ) =>
      _i29.SongInfoBloc(
        songId: songId,
        isSong: isSong,
        releasesRepository: gh<_i27.ReleasesRepository>(),
        loggerFactory: gh<_i10.LoggerFactory>(),
      ));
  gh.singleton<_i30.UsersRemoteService>(profilesModule
      .provideUsersRemoteService(gh<_i7.Dio>(instanceName: 'authorizedDio')));
  gh.singleton<_i31.UsersRepository>(
    _i32.UsersRepositoryImpl(
      loggerFactory: gh<_i10.LoggerFactory>(),
      pagedResponseFactory: gh<_i12.PagedResponseFactory>(),
      usersRemoteService: gh<_i30.UsersRemoteService>(),
      userDtoConverter: gh<_i3.Converter<_i4.UserDto, _i5.User>>(),
    ),
    dispose: (i) => i.dispose(),
  );
  gh.factoryParam<_i33.WriteReviewDialogBloc, String, dynamic>((
    id,
    _,
  ) =>
      _i33.WriteReviewDialogBloc(
        id: id,
        loggerFactory: gh<_i10.LoggerFactory>(),
        releasesRepository: gh<_i27.ReleasesRepository>(),
      ));
  gh.factoryParam<_i34.ProfileInfoBloc, String?, dynamic>((
    userId,
    _,
  ) =>
      _i34.ProfileInfoBloc(
        userId: userId,
        googleSignOutInteractor: gh<_i19.GoogleSignOutInteractor>(),
        authSessionRepository: gh<_i15.AuthSessionRepository>(),
        usersRepository: gh<_i31.UsersRepository>(),
        loggerFactory: gh<_i10.LoggerFactory>(),
      ));
  return getIt;
}

class _$AuthModule extends _i35.AuthModule {}

class _$NetworkModule extends _i36.NetworkModule {}

class _$StorageModule extends _i37.StorageModule {}

class _$PagingModule extends _i38.PagingModule {}

class _$ReleasesModule extends _i39.ReleasesModule {}

class _$ProfilesModule extends _i40.ProfilesModule {}

class _$ValidatorsModule extends _i41.ValidatorsModule {}
