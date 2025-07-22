part of '../limited_offer_bottom_sheet_view.dart';


@immutable
final class _ShowAllOffersButton extends StatelessWidget {
  const _ShowAllOffersButton({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              context.router.maybePop();
            },
            style: context.buttonStyles.textPrimaryFilledStyle,
            child: Text(
              locale.view_all_coins,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
