import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:simpe_state_management/app/theme.dart';
import 'package:simpe_state_management/domain/providers/sm_provider.dart';
import 'package:simpe_state_management/presentation/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final store =
        Store<CartState>(cartReducer, initialState: CartState.initial());
    return StoreProvider<CartState>(
      store: store,
      child: MaterialApp(
        theme: lightTheme,
        home: const HomePage(),
      ),
    );
  }
}
