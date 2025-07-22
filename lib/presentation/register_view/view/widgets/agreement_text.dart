part of '../register_view.dart';

@immutable
final class _AgreementText extends StatelessWidget {
  const _AgreementText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final agreementText = locale.i_agree_to_the_terms_and_conditions.split('*');
    return FractionallySizedBox(
      widthFactor: 0.95,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: agreementText[0],
            ),
            TextSpan(
              text: agreementText[1],
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: context.colorScheme.onSurface,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: agreementText[2],
            ),
          ],
        ),
        textAlign: TextAlign.left,
        style: context.textTheme.labelMedium?.copyWith(
          fontWeight: FontWeight.normal,
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
