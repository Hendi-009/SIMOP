import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:pa_simop/screen/splash/splash.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:pa_simop/theme/theme_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return GetMaterialApp(
      title: 'SIMOP',
      theme: themeNotifier.currentTheme,
      home: SplashScreenWidget(),
    );
  }
}
