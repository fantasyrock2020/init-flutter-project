import 'package:flutter/material.dart';

import '../../../widget/base_state/base_state_full_widget.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageStateFull<HomePage, HomeBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return const Placeholder();
  }
}
