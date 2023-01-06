part of "login_cubit.dart";

enum AuthStatus { unknows, authenticated, unauthenticated }

class LoginState extends Equatable {
  final AuthStatus status;

  LoginState._({this.status = AuthStatus.unknows});

  LoginState.authenticated()
      : this._(
          status: AuthStatus.authenticated,
        );

  LoginState.unauthenticated()
      : this._(
          status: AuthStatus.unauthenticated,
        );

  @override
  List<Object?> get props => [status];
}
