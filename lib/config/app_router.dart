// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_go_router/screens/category_screen.dart';
import 'package:flutter_go_router/screens/product_list_screen.dart';
import 'package:go_router/go_router.dart';

import '../cubits/cubit/login_cubit.dart';
import '../screens/login_screen.dart';

class AppRouter {
  final LoginCubit loginCubit;
  AppRouter(this.loginCubit);

  late final GoRouter router = GoRouter(
      routes: <GoRoute>[
        GoRoute(
          path: "/login",
          name: "login",
          builder: (BuildContext context, GoRouterState state) {
            return LoginScreen();
          },
        ),
        GoRoute(
            path: "/",
            name: "home",
            builder: (BuildContext context, GoRouterState state) {
              return CategoryScreen();
            },
            routes: [
              GoRoute(
                path: "product_list/:category",
                name: "product_list",
                builder: (BuildContext context, GoRouterState state) {
                  return ProductListScreen(
                    category: state.params["category"]!,
                    asc: state.queryParams["sort"] == "asc",
                    quantity: int.parse(state.queryParams["filter"] ?? "0"),
                  );
                },
              )
            ]),
        // GoRoute(
        //   path: "/product_list",
        //   builder: (BuildContext context, GoRouterState state) {
        //     return ProductListScreen();
        //   },
        // ),
      ],
      redirect: (BuildContext context, GoRouterState state) {
        final bool loggingIn = state.subloc == "/login";
        final bool loggedIn =
            loginCubit.state.status == AuthStatus.authenticated;
        if (!loggedIn) {
          return loggingIn ? null : "/login";
        }

        if (loggingIn) {
          return "/";
        }

        return null;
      },
      refreshListenable: GoRouterRefreshStream(loginCubit.stream));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
