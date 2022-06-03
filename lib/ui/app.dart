import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../common/app_routes.dart';
import '../cubit/home/home_cubit.dart';
import '../cubit/theme/theme_cubit.dart';
import '../di/injector.dart';
import '../generated/l10n.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  ThemeCubit themeCubit = ThemeCubit(isLight: true);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (BuildContext context) => themeCubit,
        ),
        BlocProvider<HomeCubit>(
          create: (BuildContext context) => sl<HomeCubit>(),
        ),
      ],
      child: BlocBuilder(
        bloc: themeCubit,
        builder: (context, state) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            enableLog: false,
            navigatorKey: Get.key,
            theme: themeCubit.appTheme.theme,
            initialRoute: _initMainScreen(),
            getPages: routes,
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }

  String _initMainScreen() {
    return Routes.homePage;
  }
}
