import 'package:ecommerce/common/utils.dart';
import 'package:ecommerce/core/theme/theme.dart';
import 'package:ecommerce/core/widgets/app_text_field.dart';
import 'package:ecommerce/core/widgets/primary_button.dart';
import 'package:ecommerce/common/validator.dart';
import 'package:ecommerce/features/home_screen/ui/home_page.dart';
import 'package:ecommerce/features/login/ui/login_page.dart';
import 'package:ecommerce/features/signup/provider/signup_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

part 'signup_form.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SignupProvider(),
        )
      ],
      child: const _SignUpForm(),
    );
  }
}
