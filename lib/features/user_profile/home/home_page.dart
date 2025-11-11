import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/base_state/base_state_full_widget.dart';
import 'bloc/home_bloc.dart';

class UserProfileHomePage extends StatefulWidget {
  const UserProfileHomePage({super.key});

  @override
  State<UserProfileHomePage> createState() => _UserProfileHomePageState();
}

class _UserProfileHomePageState
    extends BasePageStateFull<UserProfileHomePage, UserProfileHomeBloc> {
  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      body: Center(
        child: BlocSelector<UserProfileHomeBloc, UserProfileHomeState, int>(
          selector: (UserProfileHomeState state) {
            return state.count;
          },
          builder: (BuildContext context, int state) {
            return Text('data $state');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(const UserProfileHomeEvent.increase());
        },
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
