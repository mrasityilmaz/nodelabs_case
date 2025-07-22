part of '../login_view.dart';

@immutable
final class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    final loginBloc = context.read<LoginBloc>();
    return TextButton(
      onPressed: () {
        loginBloc.add(const LoginViewSubmitted());
      },
      style: context.buttonStyles.textPrimaryFilledStyle,
      child: Center(
        child: Text(
          locale.login,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
