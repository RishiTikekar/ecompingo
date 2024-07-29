import 'package:ecommerce/core/theme/theme.dart';
import 'package:ecommerce/di/injection.dart';
import 'package:ecommerce/features/splash_screen/ui/splash_page.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  registerDi();

  await initializeServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppThemeData.appThemeData,
        home: const SplashPage(),
      ),
    );
  }
}
