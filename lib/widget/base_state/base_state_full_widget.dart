import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/bloc/base_bloc.dart';
import '../../core/bloc/base_status/status_cubit.dart';
import '../../core/bloc/base_status/status_state.dart';
import '../../core/bloc/language/language_cubit.dart';
import '../../core/bloc/theme/theme_cubit.dart';
import '../../core/constants/colors.dart';
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
  late ThemeCubit themeCubit;
  late LanguageCubit languageCubit;

  final B bloc = getIt.get<B>();

  AppColors get appColors => themeCubit.state.colors;
  Locale get locale => languageCubit.state.locale;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    themeCubit = BlocProvider.of<ThemeCubit>(context);
    languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  void didUpdateWidget(covariant T oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final StatusCubit status = bloc.statusCubit;

    return MultiBlocProvider(
      // ignore: always_specify_types
      providers: [
        BlocProvider<B>(create: (_) => bloc),
        BlocProvider<StatusCubit>.value(value: status),
      ],
      child: Stack(
        children: <Widget>[
          buildPage(context),
          BlocConsumer<StatusCubit, StatusState>(
            bloc: status,
            listener: buildListener,
            builder: buildBuilder,
          ),
        ],
      ),
    );
  }

  @protected
  Widget buildPage(BuildContext context);

  void buildListener(BuildContext context, StatusState state) {
    if (state.isError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.errorMessage ?? 'An error occurred')),
      );
    }
  }

  Widget buildBuilder(BuildContext context, StatusState state) {
    if (state.isLoading && state.isShowLoading) {
      Widget loadingWidget = const Center(child: CircularProgressIndicator());
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
  }

  @override
  void dispose() {
    super.dispose();
  }
}
