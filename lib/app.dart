import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:ten_twenty_task/configs/theme/provider/app_provider.dart';
import 'package:ten_twenty_task/routes/routes.dart';
import 'package:ten_twenty_task/screens/detail/bloc/detail_bloc.dart';
import 'package:ten_twenty_task/screens/splash/splash_screen.dart';
import 'package:ten_twenty_task/screens/tabs/watch/bloc/watch_bloc.dart';
import 'package:ten_twenty_task/screens/video/bloc/video_bloc.dart';

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
      providers: [
        BlocProvider<WatchBloc>(create: (context) => WatchBloc()),
        BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
        BlocProvider<VideoBloc>(create: (context) => VideoBloc()),
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
      home: const MyCustomSplashScreen(),
    );
  }
}
