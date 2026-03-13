import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/login_admin_use_case.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginAdminUseCase loginAdminUseCase})
    : _loginAdminUseCase = loginAdminUseCase,
      super(const LoginState.initial()) {
    on<LoginEvent>(_onEvent);
  }

  final LoginAdminUseCase _loginAdminUseCase;

  Future<void> _onEvent(LoginEvent event, Emitter<LoginState> emit) async {
    await event.when(
      submitted: (email, password) async {
        emit(const LoginState.loading());

        final user = await _loginAdminUseCase(email: email, password: password);

        if (user == null) {
          emit(
            const LoginState.failure('Invalid admin credentials. Please try again.'),
          );
          return;
        }

        emit(LoginState.success(user));
      },
      reset: () async {
        emit(const LoginState.initial());
      },
    );
  }
}
