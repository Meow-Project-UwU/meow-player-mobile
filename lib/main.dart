import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:loveappcount/app/theme/app_theme.dart';

import 'app/di/injector.dart';
import 'common/router/app_router.dart';

void main() {
  configureDependencies();

  final appRouter = injector<AppRouter>();

  runApp(MyApp(router: appRouter.router));
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: router, theme: AppTheme.light);
  }
}
