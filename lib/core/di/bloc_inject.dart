import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';

class BlocInject<T extends StateStreamableSource<Object?>> extends StatelessWidget {
  final GetIt getIt;
  final Widget child;
  final dynamic param1;
  final dynamic param2;

  const BlocInject({
    super.key,
    required this.getIt,
    required this.child,
    this.param1,
    this.param2,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) => getIt.get<T>(param1: param1, param2: param2),
      child: child,
    );
  }
}
