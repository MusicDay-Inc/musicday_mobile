// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:musicday_mobile/application_di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(asExtension: false)
void configureDependencies() => init(getIt);
