import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_arch/common/routes.dart';
import 'package:flutter_bloc_clean_arch/presentation/pages/News.dart';
import 'package:flutter_bloc_clean_arch/presentation/pages/News_Detail.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: AppRoutes.NEWS_ROUTE_NAME,
      path: AppRoutes.NEWS_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return const NewsPage();
      },
    ),

    GoRoute(
      name: AppRoutes.NEWS_DETAILS_ROUTE_NAME,
      path: AppRoutes.NEWS_DETAILS_ROUTE_PATH,
      builder: (BuildContext context, GoRouterState state) {
        return NewsDetailsPage(url: state.extra.toString());
      },
    ),
  ]
);