import 'package:ecommerce/common/utils.dart';
import 'package:ecommerce/core/theme/color/app_colors.dart';
import 'package:ecommerce/core/theme/text_styles/app_text_style.dart';
import 'package:ecommerce/core/widgets/app_text_field.dart';
import 'package:ecommerce/core/widgets/primary_button.dart';
import 'package:ecommerce/common/validator.dart';
import 'package:ecommerce/features/home_screen/ui/home_page.dart';
import 'package:ecommerce/features/login/provider/login_provider.dart';
import 'package:ecommerce/features/signup/ui/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
      ],
      child: const _LoginForm(),
    );
  }
}
