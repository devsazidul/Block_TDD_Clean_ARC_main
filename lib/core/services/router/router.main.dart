part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoute.getLoginScreen:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (context) => sl<AuthCubit>(),
          child: LoginScreen(),
        ),
        settings: settings,
      );

    default:
      return _pageBuilder((_) => const Placeholder(), settings: settings);
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) =>
        FadeTransition(opacity: animation, child: child),
    pageBuilder: (context, _, __) => page(context),
  );
}
