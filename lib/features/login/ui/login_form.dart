part of 'login_page.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final loginPvd = context.read<LoginProvider>();
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColors.grey,
        title: Text(
          'e-Shop',
          style: AppTextStyle.t_20_700.copyWith(color: AppColors.blue),
        ),
      ),
      body: Form(
        key: loginPvd.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                hintText: 'Email',
                validator: Validators.emailValidator,
                controller: loginPvd.emailController,
              ),
              const SizedBox(height: 19),
              AppTextField(
                hintText: 'Password',
                validator: Validators.passwordValidator,
                controller: loginPvd.passwordController,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const _BottomNavigationWidget(),
    );
  }
}

class _BottomNavigationWidget extends StatelessWidget {
  const _BottomNavigationWidget();

  @override
  Widget build(BuildContext context) {
    final loginPvd = context.watch<LoginProvider>();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 231,
          child: PrimaryButton(
            buttonText: 'Login',
            onPressed: !loginPvd.isLoading
                ? () {
                    loginPvd.login(
                      onSuccess: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => const HomePage(),
                          ),
                        );
                        Utils.showToast(
                          message: 'Successfully logged In',
                          toastType: ToastType.error,
                        );
                      },
                      onFailure: (errorMsg) {
                        Utils.showToast(
                          message: errorMsg,
                          toastType: ToastType.error,
                        );
                      },
                    );
                  }
                : null,
          ),
        ),
        const SizedBox(height: 13),
        Text.rich(
          TextSpan(
            text: 'New here? ',
            style: AppTextStyle.t_16_400.copyWith(
              color: AppColors.black,
            ),
            children: [
              TextSpan(
                text: 'Singup',
                style: AppTextStyle.t_16_700.copyWith(
                  color: AppColors.blue,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const SignupPage(),
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
