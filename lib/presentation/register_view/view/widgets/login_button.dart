part of '../register_view.dart';

@immutable
final class _LoginButton extends StatelessWidget {
  const _LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return TextButton(
      onPressed: () {
        context.router.push(const LoginRoute());
      },
      style: context.buttonStyles.miniTransparentStyle,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: locale.already_have_account,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            TextSpan(
              text: '\t\t${locale.login}!',
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: context.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
