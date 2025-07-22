import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_event.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';
import 'package:nodelabs_movie_case/presentation/login_view/bloc/login_event.dart';
import 'package:nodelabs_movie_case/presentation/login_view/bloc/login_state.dart';
import 'package:nodelabs_movie_case/presentation/login_view/models/models.dart';

final class LoginBloc extends Bloc<LoginViewEvent, LoginViewState> with ClassLoggerMixin {
  LoginBloc(this._userBloc) : super(const LoginViewState()) {
    on<LoginViewSubmitted>(_onSubmitted);
    on<LoginViewEmailChanged>(_onEmailChanged);
    on<LoginViewPasswordChanged>(_onPasswordChanged);
    on<LoginViewObscurePasswordPressed>(_onObscurePasswordPressed);
  }

  //
  // MARK: - Dependencies
  //

  final UserBloc _userBloc;

  //
  // MARK: - Events
  //

  Future<void> _onSubmitted(LoginViewSubmitted event, Emitter<LoginViewState> emit) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      _userBloc.add(
        UserLoginRequested(
          email: state.email.value,
          password: state.password.value,
        ),
      );

      await for (final userState in _userBloc.stream) {
        if (userState.isAuthenticated) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
          break;
        } else if (userState.hasError) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: userState.error));
          break;
        }
      }
    } catch (e, s) {
      logError('Login failed with unknown error', error: e, stackTrace: s);
      emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: 'UNKNOWN_ERROR'));
    }
  }

  void _onObscurePasswordPressed(LoginViewObscurePasswordPressed event, Emitter<LoginViewState> emit) {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void _onEmailChanged(LoginViewEmailChanged event, Emitter<LoginViewState> emit) {
    final email = LoginEmail.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void _onPasswordChanged(LoginViewPasswordChanged event, Emitter<LoginViewState> emit) {
    final password = LoginPassword.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([password, state.email]),
      ),
    );
  }
}
