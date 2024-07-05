import 'package:flutter_rpg/routerObserver.dart';
import 'package:flutter_rpg/screens/characters/create.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  observers: [MyNavigatorObserver()],
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(path: "/", name: "home", builder: (context, state) => const Home()),
    GoRoute(
        path: "/create",
        name: "create",
        builder: (context, state) => const Create()),
  ],
);
