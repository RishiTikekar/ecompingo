part of 'splash_page.dart';

class _SplashForm extends StatelessWidget {
  const _SplashForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoading = context
        .select<SplashProvider, bool>((splashPvd) => splashPvd.isLoading);
    final bool isLoggedIn = context
        .select<SplashProvider, bool>((splashPvd) => splashPvd.isLoggedIn);
    if (isLoading) {
      return const _LoaderWidget();
    } else if (isLoggedIn) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}

class _LoaderWidget extends StatelessWidget {
  const _LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "E-shop",
              style: AppTextStyle.t_30_700,
            ),
            SizedBox(height: 16),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
