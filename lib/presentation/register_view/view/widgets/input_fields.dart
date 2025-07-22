part of '../register_view.dart';

@immutable
final class _InputFields extends StatelessWidget {
  const _InputFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _NameSurnameTextField(),
        Gap.normalHeight(),
        _EmailTextField(),
        Gap.normalHeight(),
        _PasswordTextField(),
        Gap.normalHeight(),
        _ConfirmPasswordTextField(),
        Gap.normalHeight(),
      ],
    );
  }
}

@immutable
final class _NameSurnameTextField extends StatelessWidget {
  const _NameSurnameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final state = context.read<RegisterBloc>();
    final nameSurnameError = context.select<RegisterBloc, RegisterNameSurnameValidationError?>(
      (bloc) => bloc.state.nameSurname.displayError,
    );
    return ProjectTextField(
      context: context,
      hintText: locale.nameSurname,
      prefixIconPath: Assets.icons.name_surname_icon_svg,
      onChanged: (value) {
        state.add(
          RegisterViewFormChanged<RegisterNameSurname>(
            value: value,
          ),
        );
      },
      errorText: switch (nameSurnameError) {
        RegisterNameSurnameValidationError.empty => locale.nameSurname_required,
        RegisterNameSurnameValidationError.minLength => locale.nameSurname_min_length,
        RegisterNameSurnameValidationError.maxLength => locale.nameSurname_max_length,
        RegisterNameSurnameValidationError.invalid => locale.nameSurname_invalid,
        null => null,
      },
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}

@immutable
final class _EmailTextField extends StatelessWidget {
  const _EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final state = context.read<RegisterBloc>();
    final emailError = context.select<RegisterBloc, RegisterEmailValidationError?>(
      (bloc) => bloc.state.email.displayError,
    );
    return ProjectTextField(
      context: context,
      hintText: locale.email,
      prefixIconPath: Assets.icons.email_icon_svg,
      onChanged: (value) {
        state.add(
          RegisterViewFormChanged<RegisterEmail>(
            value: value,
          ),
        );
      },
      errorText: switch (emailError) {
        RegisterEmailValidationError.empty => locale.email_required,
        RegisterEmailValidationError.invalid => locale.email_invalid,
        null => null,
      },
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
    );
  }
}

@immutable
final class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final state = context.read<RegisterBloc>();
    final passwordError = context.select<RegisterBloc, RegisterPasswordValidationError?>(
      (bloc) => bloc.state.password.displayError,
    );
    return ProjectTextField(
      context: context,
      hintText: locale.password,
      prefixIconPath: Assets.icons.password_icon_svg,
      obscureText: context.select<RegisterBloc, bool>(
        (bloc) => bloc.state.obscurePassword,
      ),
      onObscurePressed: () {
        state.add(const RegisterViewObscurePasswordPressed());
      },
      onChanged: (value) {
        state.add(
          RegisterViewFormChanged<RegisterPassword>(
            value: value,
          ),
        );
      },
      errorText: switch (passwordError) {
        RegisterPasswordValidationError.empty => locale.password_required,
        RegisterPasswordValidationError.tooShort => locale.password_min_length,
        RegisterPasswordValidationError.tooLong => locale.password_max_length,
        RegisterPasswordValidationError.weak => locale.password_weak,
        RegisterPasswordValidationError.notMatch => locale.password_confirmation_not_match,
        null => null,
      },
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.next,
    );
  }
}

@immutable
final class _ConfirmPasswordTextField extends StatelessWidget {
  const _ConfirmPasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final state = context.read<RegisterBloc>();
    final passwordError = context.select<RegisterBloc, RegisterPasswordValidationError?>(
      (bloc) => bloc.state.confirmPassword.displayError,
    );
    return ProjectTextField(
      context: context,
      hintText: locale.password_confirmation,
      prefixIconPath: Assets.icons.password_icon_svg,
      obscureText: context.select<RegisterBloc, bool>(
        (bloc) => bloc.state.obscureConfirmPassword,
      ),
      onObscurePressed: () {
        state.add(const RegisterViewObscureConfirmPasswordPressed());
      },
      onChanged: (value) {
        state.add(
          RegisterViewFormChanged<RegisterConfirmPassword>(
            value: value,
          ),
        );
      },
      errorText: switch (passwordError) {
        RegisterPasswordValidationError.empty => locale.password_confirmation_required,
        RegisterPasswordValidationError.tooShort => locale.password_confirmation_min_length,
        RegisterPasswordValidationError.tooLong => locale.password_confirmation_max_length,
        RegisterPasswordValidationError.weak => locale.password_weak,
        RegisterPasswordValidationError.notMatch => locale.password_confirmation_not_match,
        null => null,
      },
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
