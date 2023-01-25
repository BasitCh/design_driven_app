// ignore_for_file: deprecated_member_use

import 'package:black_bull_markets/app_bloc_observer.dart';
import 'package:black_bull_markets/blackbull_app.dart';
import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/shared/screen_util/screen_util.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
Future<void> main() async {
  // await dotenv.load(fileName: FileAssets.appEnvironment);
  //configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  registerServices();

  BlocOverrides.runZoned(
    () {
      runApp(const ScreenUtilSetup(child: BlackBullApp()));
    },
    blocObserver: AppBlocObserver(),
  );
}
