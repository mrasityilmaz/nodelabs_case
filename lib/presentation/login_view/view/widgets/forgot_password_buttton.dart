part of '../login_view.dart';

@immutable
final class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);

    return Align(
      alignment: Alignment.centerLeft,
      child: TextButton(
        onPressed: () {},
        style: context.buttonStyles.miniTransparentStyle,
        child: Text(
          locale.forgot_password,
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.normal,
            decoration: TextDecoration.underline,
            color: context.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
