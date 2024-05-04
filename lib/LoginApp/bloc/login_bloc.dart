import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginRequested>(_loginRequested);

    on<LogoutRequested>(_logoutRequested);
  }

  void _loginRequested(LoginRequested event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final username = event.username;
      final password = event.password;
      if (username==null || username.isEmpty) {
         return emit(loginFailure("Enter User name"));
      } 
      else if (password.length < 4) {
        return emit(loginFailure("Password cannot be less than 4 letters."));
      }

      await Future.delayed(Duration(seconds: 2), () {
        return emit(LoginSucess(
            "Login Successful \n Your User Id is $username$password",
            username,
            password));
      });
    } catch (e) {
      return emit(loginFailure(e.toString()));
    }
  }

  void _logoutRequested(LogoutRequested event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      await Future.delayed(Duration(seconds: 2), () {
        return emit(LoginInitial());
      });
    } catch (e) {
      return emit(loginFailure(e.toString()));
    }
  }
}
