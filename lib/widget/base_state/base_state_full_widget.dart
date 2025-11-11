import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/bloc/base_bloc.dart';
import '../../core/bloc/base_status/status_cubit.dart';
import '../../core/bloc/base_status/status_state.dart';

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
  late B bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    bloc = BlocProvider.of<B>(context);
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final StatusCubit status = bloc.statusCubit;

    return BlocProvider<StatusCubit>.value(
      value: status,
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

  @override
  void dispose() {
    super.dispose();
  }
}
