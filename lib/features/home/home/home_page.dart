import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/app_routes.dart';
import '../../../widget/base_state/base_state_full_widget.dart';
import 'bloc/home_bloc.dart';

class HomeHomePage extends StatefulWidget {
  const HomeHomePage({super.key});

  @override
  State<HomeHomePage> createState() => _HomeHomePageState();
}

class _HomeHomePageState extends BasePageStateFull<HomeHomePage, HomeHomeBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              unawaited(context.pushNamed(AppRoutes.user));
            },
            child: const Text('Push next'),
          ),
          const Text('data'),
        ],
      ),
    );
  }
}
