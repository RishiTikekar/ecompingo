part of 'signup_page.dart';

class _SignUpForm extends StatelessWidget {
  const _SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final signupPvd = context.read<SignupProvider>();
    return Form(
      key: signupPvd.formKey,
      child: Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: AppColors.grey,
          title: Text(
            'e-Shop',
            style: AppTextStyle.t_20_700.copyWith(color: AppColors.blue),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                hintText: 'Username',
                validator: Validators.usernameValidator,
                controller: signupPvd.userNameController,
              ),
              const SizedBox(height: 19),
              AppTextField(
                hintText: 'Email',
                validator: Validators.emailValidator,
                controller: signupPvd.emailController,
              ),
              const SizedBox(height: 19),
              AppTextField(
                hintText: 'Password',
                validator: Validators.passwordValidator,
                controller: signupPvd.passwordController,
              ),
            ],
          ),
        ),
        bottomNavigationBar: const _BottomNavigationWidget(),
      ),
    );
  }
}

class _BottomNavigationWidget extends StatelessWidget {
  const _BottomNavigationWidget();

  @override
  Widget build(BuildContext context) {
    final signupPvd = context.watch<SignupProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 231,
          child: PrimaryButton(
            buttonText: 'Signup',
            onPressed: signupPvd.isLoading
                ? null
                : () {
                    signupPvd.signup(
                      onSuccess: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                        Utils.showToast(
                            message: 'Successfully signed up!',
                            toastType: ToastType.success);
                      },
                      onFailure: (errorMsg) {
                        Utils.showToast(
                          message: errorMsg,
                          toastType: ToastType.error,
                        );
                      },
                    );
                  },
          ),
        ),
        const SizedBox(height: 13),
        Text.rich(
          TextSpan(
            text: 'Already have an account? ',
            style: AppTextStyle.t_16_400.copyWith(
              color: AppColors.black,
            ),
            children: [
              TextSpan(
                text: 'Login',
                style: AppTextStyle.t_16_700.copyWith(
                  color: AppColors.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const LoginPage(),
                        ),
                      ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 52),
      ],
    );
  }
}
