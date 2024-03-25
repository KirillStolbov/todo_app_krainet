import 'package:flutter/material.dart';

import '../../../../entities/user/user_data.dart';
import '../../../../exceptions/try_catch.dart';
import '../../app_scope.dart';
import 'service/auth_service.dart';

class Auth extends StatefulWidget {
  const Auth({required this.unauthenticated, required this.authenticated, super.key});

  final Widget unauthenticated;
  final Widget Function(UserData user) authenticated;

  static AuthState of(BuildContext context, {bool listen = false}) {
    AuthState? state;

    if (listen) {
      state = context.dependOnInheritedWidgetOfExactType<_AuthInheritedWidget>()?.state;
    } else {
      state = context.getInheritedWidgetOfExactType<_AuthInheritedWidget>()?.state;
    }

    if (state == null) throw Exception('Invalid context: missing _AuthInheritedWidget');

    return state;
  }

  @override
  State<Auth> createState() => AuthState();
}

class AuthState extends State<Auth> {
  late final AuthService _service = AppScope.dependenciesOf(context).authService;

  bool get showSignInScreen => _service.showSignInScreen;
  set showSignInScreen(bool value) => setState(() => _service.showSignInScreen = value);

  bool get showSignUpScreen => _service.showSignUpScreen;
  set showSignUpScreen(bool value) => setState(() => _service.showSignUpScreen = value);

  EitherFuture<void> signIn(String email, String password) => tryCatchEither(
        fn: () => _service.signIn(email, password),
      );

  EitherFuture<void> signUp(String name, String email, String password) => tryCatchEither(
        fn: () => _service.signUp(name, email, password),
      );

  EitherFuture<void> signOut() => tryCatchEither(
        fn: _service.signOut,
      );

  @override
  Widget build(BuildContext context) => _AuthInheritedWidget(
        state: this,
        showSignInScreen: showSignInScreen,
        showSignUpScreen: showSignUpScreen,
        child: StreamBuilder<UserData?>(
          initialData: _service.authStateChanges.valueOrNull,
          stream: _service.authStateChanges,
          builder: (context, snapshot) {
            final user = snapshot.data;

            if (user == null) return widget.unauthenticated;

            return widget.authenticated(user);
          },
        ),
      );
}

class _AuthInheritedWidget extends InheritedWidget {
  const _AuthInheritedWidget({
    required super.child,
    required this.state,
    required this.showSignInScreen,
    required this.showSignUpScreen,
  });

  final AuthState state;
  final bool showSignInScreen;
  final bool showSignUpScreen;

  @override
  bool updateShouldNotify(_AuthInheritedWidget oldWidget) => oldWidget.showSignInScreen != showSignInScreen || oldWidget.showSignUpScreen != showSignUpScreen;
}
