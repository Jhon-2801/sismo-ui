import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:sismo/config/routes/app_router.dart';
import 'package:sismo/presentation/pages/pages.dart';
import 'package:sismo/presentation/providers/providers.dart';
import 'package:sismo/presentation/services/services.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SideMenuProvider(),
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      title: 'Sismo App',
      scaffoldMessengerKey: NotificationsService.messagerKey,
      builder: (_, child) => HomePage(child: child!),
    );
  }
}
