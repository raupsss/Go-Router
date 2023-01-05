import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.unauthenticated());

  void login() {
    emit(LoginState.authenticated());
  }

  void logout() {
    emit(LoginState.unauthenticated());
  }
}
