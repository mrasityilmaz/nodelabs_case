part of '../login_view.dart';

@immutable
final class _InputFields extends StatelessWidget {
  const _InputFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final state = context.read<LoginBloc>();
    final emailError = context.select<LoginBloc, LoginEmailValidationError?>(
      (bloc) => bloc.state.email.displayError,
    );
    final passwordError = context.select<LoginBloc, LoginPasswordValidationError?>(
      (bloc) => bloc.state.password.displayError,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ProjectTextField(
          context: context,
          hintText: locale.email,
          prefixIconPath: Assets.icons.email_icon_svg,
          onChanged: (value) {
            state.add(LoginViewEmailChanged(email: value));
          },
          errorText: switch (emailError) {
            LoginEmailValidationError.empty => locale.email_required,
            LoginEmailValidationError.invalid => locale.email_invalid,
            null => null,
          },
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        ),
        const Gap.normalHeight(),
        ProjectTextField(
          context: context,
          hintText: locale.password,
          prefixIconPath: Assets.icons.password_icon_svg,
          obscureText: context.select<LoginBloc, bool>(
            (bloc) => bloc.state.obscurePassword,
          ),
          onObscurePressed: () {
            state.add(const LoginViewObscurePasswordPressed());
          },
          onChanged: (value) {
            state.add(LoginViewPasswordChanged(password: value));
          },
          errorText: switch (passwordError) {
            LoginPasswordValidationError.empty => locale.password_required,
            _ => null,
          },
          keyboardType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
