import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mortgage/app_router.dart';
import 'package:mortgage/app_theme.dart';
import 'package:mortgage/config.dart';
import 'package:mortgage/modles/loans_change_notifier.dart';
import 'package:mortgage/notifx.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await FirebaseRemoteConfig.instance.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 10),
    minimumFetchInterval: const Duration(seconds: 10),
  ));

  await FirebaseRemoteConfig.instance.fetchAndActivate();

  await NotificationServiceFb().activate();

  final shPref = await SharedPreferences.getInstance();

  runApp(MyApp(shPref: shPref));
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.shPref,
  });

  final SharedPreferences shPref;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routerConfig = AppRouter.config;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoansChangeNotifier(widget.shPref)..init(),
        ),
        Provider.value(value: widget.shPref),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: AppTheme.theme,
        routerConfig: routerConfig,
      ),
    );
  }
}
