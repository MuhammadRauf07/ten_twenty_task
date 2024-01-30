import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_task/configs/theme/provider/app_provider.dart';
import 'package:ten_twenty_task/main/main_screen.dart';
import 'package:ten_twenty_task/routes/routes.dart';

import 'configs/theme/core_theme.dart' as theme;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        ///TODO
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
        ],
        child: Consumer<AppProvider>(
          builder: (context, value, _) => MyAppCoreWidget(
            provider: value,
          ),
        ),
      ),
    );
  }
}

class MyAppCoreWidget extends StatelessWidget {
  final AppProvider provider;

  const MyAppCoreWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TenTwenty Task',
      theme: theme.themeLight,
      darkTheme: theme.themeDark,
      navigatorKey: Navigate.navigatorKey,
      themeMode: provider.themeMode,
      home: const MainScreen(),
    );
  }
}
