import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/bloc/base_bloc.dart';
import '../../core/bloc/base_status/status_cubit.dart';
import '../../core/bloc/base_status/status_state.dart';
import '../../core/di/injector.dart';

abstract class BasePageStateFull<
  T extends StatefulWidget,
  B extends BaseBloc<dynamic, dynamic>
>
    extends BasePageStateFullDelegate<T, B> {}

abstract class BasePageStateFullDelegate<
  T extends StatefulWidget,
  B extends BaseBloc<dynamic, dynamic>
>
    extends State<T> {
  final B bloc = getIt.get<B>();

  StatusCubit get status => bloc.statusCubit;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<StateStreamableSource<dynamic>>>[
        BlocProvider<B>(create: (_) => bloc, lazy: false),
        BlocProvider<StatusCubit>.value(value: status),
      ],
      child: Stack(
        children: <Widget>[
          buildPage(context),
          BlocConsumer<StatusCubit, StatusState>(
            bloc: status,
            listener: (BuildContext context, StatusState state) {
              if (state.isError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage ?? 'An error occurred'),
                  ),
                );
              }
            },
            builder: (BuildContext context, StatusState state) {
              if (state.isLoading && state.isShowLoading) {
                Widget loadingWidget = const Center(
                  child: CircularProgressIndicator(),
                );
                if (state.useOverlay) {
                  loadingWidget = Positioned.fill(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: loadingWidget,
                    ),
                  );
                }
                return loadingWidget;
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  @protected
  Widget buildPage(BuildContext context);
}
