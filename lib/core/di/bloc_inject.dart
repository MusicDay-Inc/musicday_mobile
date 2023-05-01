import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';

class BlocInject<T extends Bloc> extends StatelessWidget {
  final GetIt getIt;
  final Widget child;

  const BlocInject({
    super.key,
    required this.getIt,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) => getIt.get<T>(),
      child: child,
    );
  }
}
