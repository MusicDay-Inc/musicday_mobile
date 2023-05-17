import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/core/logging/logger.dart';
import 'package:musicday_mobile/core/logging/logger_factory.dart';
import 'package:musicday_mobile/profiles/interactors/avatar_upload_interactor.dart';
import 'package:musicday_mobile/profiles/repositories/users_repository.dart';

@Singleton(as: AvatarUploadInteractor)
class AvatarUploadInteractorImpl implements AvatarUploadInteractor {
  final _picker = ImagePicker();
  final UsersRepository usersRepository;
  final Logger _logger;

  AvatarUploadInteractorImpl({
    required LoggerFactory loggerFactory,
    required this.usersRepository,
  }) : _logger = loggerFactory.create("AvatarUploadInteractorImpl");

  @override
  Future<bool> startAvatarUpload(String id) async {
    _logger.debug("startAvatarUpload()");

    final file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) {
      _logger.debug("startAvatarUpload(): file not selected.");
      return false;
    }

    _logger.debug("startAvatarUpload(): file selected");
    _logger.debug("startAvatarUpload(): path = ${file.path}");
    final result = await usersRepository.uploadAvatar(id, File(file.path));
    return result;
  }
}
