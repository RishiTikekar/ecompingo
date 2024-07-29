import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theme/theme.dart';
import 'package:ecommerce/core/widgets/primary_button.dart';
import 'package:ecommerce/features/home_screen/models/product.dart';
import 'package:ecommerce/features/home_screen/provider/home_screen_provider.dart';
import 'package:ecommerce/features/login/provider/login_provider.dart';
import 'package:ecommerce/features/login/ui/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'home_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => HomeScreenProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        )
      ],
      child: const _HomeForm(),
    );
  }
}
