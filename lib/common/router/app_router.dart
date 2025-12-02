import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:loveappcount/feat/authen/signin/presentation/page/sign_in_page.dart';

@lazySingleton
class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (_, __) => const SignInPage(),
        ),
      ],
      errorBuilder: (_, state) =>
          Scaffold(body: Center(child: Text('Error: ${state.error}'))),
    );
  }
}
