// Import Flutter
import 'package:flutter/material.dart';

import 'package:business_layer/states/app_state.dart';
import 'package:model_layer/model_layer.dart';

// Import Localizations
import 'package:spirit/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Import Packages
import 'package:spirit/fluro_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import Modules
import 'package:spirit/src/styles/app_colors.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppStateBloc()),
      ],
      child: BlocBuilder<AppStateBloc, AppStateModel>(
        builder: (BuildContext context, state) {
          return MaterialApp(
            title: 'Spirit',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: mainColor400),
              useMaterial3: true,
            ),
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            initialRoute: '/',
            onGenerateRoute: MyFluroRouter.router.generator,
          );
        },
      ),
    );
  }
}
