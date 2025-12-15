import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/image/c_image.dart';

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
          const CImageView(
            url:
                'https://www.bigfootdigital.co.uk/wp-content/uploads/2020/07/image-optimisation-scaled.jpg',
          ),
          ElevatedButton(
            onPressed: () {
              unawaited(context.pushNamed(AppRoutes.todo));
            },
            child: const Text('Push next'),
          ),
          Text('data', style: textStyles.displayLarge),
        ],
      ),
    );
  }
}
