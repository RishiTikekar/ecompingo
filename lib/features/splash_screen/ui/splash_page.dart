import 'package:ecommerce/core/theme/theme.dart';
import 'package:ecommerce/features/home_screen/ui/home_page.dart';
import 'package:ecommerce/features/login/ui/login_page.dart';
import 'package:ecommerce/features/splash_screen/provider/splash_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'splash_form.dart';

class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashProvider(),
        )
      ],
      child: const _SplashForm(),
    );
  }
}
