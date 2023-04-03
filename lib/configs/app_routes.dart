import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/modules/home_screen/home_screen.dart';
import 'package:pertemuan_v/modules/news_detail_screen/news_detail_screen.dart';
import 'package:pertemuan_v/modules/splash_screen/splash_screen.dart';

import '../models/user.dart';

class AppRoutes {
  static const String splash = "splash";
  static const String home = "home";
  static const String newsDetail = "news-detail";

  static Page _splahScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: SplashScreen(),
    );
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra! as User;
    } else {
      user = User(
        id: 002,
        name: "Dadan Ahmad Badar M",
        username: "dadan",
        email: "2006116@gmail.com",
        profilePhoto:
            "https://upload.wikimedia.org/wikipedia/commons/6/66/Puan_Maharani%2C_Ketua_DPR_RI.jpg",
        phoneNumber: "082128969121",
      );
    }
    return MaterialPage(
      child: HomeScreen(
        user: user,
      ),
    );
  }

  static Page _newsDetailScreenBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      child: NewsDetailScreen(
        id: state.params["id"]!,
      ),
    );
  }

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splahScreenBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenBuilder,
        routes: [
          GoRoute(
            name: newsDetail,
            path: "news-detail:id",
            pageBuilder: _newsDetailScreenBuilder,
          ),
        ],
      ),
    ],
    initialLocation: "/splash",
  );
}
