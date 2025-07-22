import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_event.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_state.dart';
import 'package:nodelabs_movie_case/core/services/logger_service/class_logger_mixin.dart';
import 'package:nodelabs_movie_case/presentation/register_view/bloc/register_event.dart';
import 'package:nodelabs_movie_case/presentation/register_view/bloc/register_state.dart';
import 'package:nodelabs_movie_case/presentation/register_view/models/models.dart';

final class RegisterBloc extends Bloc<RegisterViewEvent, RegisterViewState> with ClassLoggerMixin {
  RegisterBloc(this._userBloc) : super(const RegisterViewState()) {
    on<RegisterViewRegisterPressed>(_onRegisterPressed);
    on<RegisterViewFormChanged>(_onFormChanged);
    on<RegisterViewObscurePasswordPressed>(_onObscurePasswordPressed);
    on<RegisterViewObscureConfirmPasswordPressed>(_onObscureConfirmPasswordPressed);

    instanceInitialized();
  }

  //
  // MARK: - Dependencies
  //

  final UserBloc _userBloc;

  //
  // MARK: Events
  //

  Future<void> _onRegisterPressed(RegisterViewRegisterPressed event, Emitter<RegisterViewState> emit) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      _userBloc.add(
        UserRegisterRequested(
          name: state.nameSurname.value,
          email: state.email.value,
          password: state.password.value,
        ),
      );

      await for (final userState in _userBloc.stream) {
        if (userState is UserSuccessfullyRegisteredState) {
          emit(state.copyWith(status: FormzSubmissionStatus.success));
          break;
        } else if (userState.hasError) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: userState.error));
          break;
        }
      }
    } catch (e, s) {
      logError('Register failed with unknown error', error: e, stackTrace: s);
      emit(state.copyWith(status: FormzSubmissionStatus.failure, errorMessage: 'UNKNOWN_ERROR'));
    }
  }

  void _onObscurePasswordPressed(RegisterViewObscurePasswordPressed event, Emitter<RegisterViewState> emit) {
    emit(
      state.copyWith(
        obscurePassword: !state.obscurePassword,
      ),
    );
  }

  void _onObscureConfirmPasswordPressed(
    RegisterViewObscureConfirmPasswordPressed event,
    Emitter<RegisterViewState> emit,
  ) {
    emit(
      state.copyWith(
        obscureConfirmPassword: !state.obscureConfirmPassword,
      ),
    );
  }

  void _onFormChanged<F extends FormzInput<String, Enum>>(
    RegisterViewFormChanged<F> event,
    Emitter<RegisterViewState> emit,
  ) {
    final updateForm = switch (event) {
      RegisterViewFormChanged<RegisterNameSurname>() =>
        state.copyWith(nameSurname: RegisterNameSurname.dirty(event.value)),
      RegisterViewFormChanged<RegisterEmail>() => state.copyWith(email: RegisterEmail.dirty(event.value)),
      RegisterViewFormChanged<RegisterPassword>() => state.copyWith(
          password: RegisterPassword.dirty(
            event.value,
            state.confirmPassword.value,
          ),
        ),
      RegisterViewFormChanged<RegisterConfirmPassword>() => state.copyWith(
          confirmPassword: RegisterConfirmPassword.dirty(
            event.value,
            state.password.value,
          ),
        ),
      _ => null,
    };
    if (updateForm == null) return;
    emit(
      updateForm.copyWith(
        isValid: Formz.validate([
          updateForm.nameSurname,
          updateForm.email,
          updateForm.password,
          updateForm.confirmPassword,
        ]),
      ),
    );
  }
}
