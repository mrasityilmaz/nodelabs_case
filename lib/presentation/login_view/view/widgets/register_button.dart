part of '../login_view.dart';

@immutable
final class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return TextButton(
      onPressed: () {
        context.router.push(const RegisterRoute());
      },
      style: context.buttonStyles.miniTransparentStyle,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: locale.dont_have_account,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
            TextSpan(
              text: '\t\t${locale.register}!',
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
