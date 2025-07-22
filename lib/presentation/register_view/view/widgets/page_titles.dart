part of '../register_view.dart';

@immutable
final class _PageTitles extends StatelessWidget {
  const _PageTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return FractionallySizedBox(
      widthFactor: .8,
      child: Column(
        children: [
          Text(
            locale.welcome,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onSurface,
            ),
          ),
          const Gap.lowHeight(),
          Text(
            locale.welcome_description,
            style: context.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.normal,
              color: context.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
