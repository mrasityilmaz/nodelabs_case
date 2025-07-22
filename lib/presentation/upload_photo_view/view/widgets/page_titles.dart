part of '../upload_photo_view.dart';

@immutable
final class _PageTitles extends StatelessWidget {
  const _PageTitles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Center(
      child: FractionallySizedBox(
        widthFactor: .8,
        child: Column(
          children: [
            Text(
              locale.upload_profile_photo,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurface,
              ),
            ),
            const Gap.lowHeight(),
            Text(
              locale.upload_profile_photo_description,
              style: context.textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.normal,
                color: context.colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
