// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_go_router/screens/category_screen.dart';
import 'package:flutter_go_router/screens/product_list_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
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
);
