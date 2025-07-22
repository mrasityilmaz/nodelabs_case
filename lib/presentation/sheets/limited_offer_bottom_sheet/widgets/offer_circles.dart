part of '../limited_offer_bottom_sheet_view.dart';


@immutable
final class _LimitedOfferBlurredCircle extends StatelessWidget {
  const _LimitedOfferBlurredCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      width: size.width * .5,
      height: size.width * .5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.primary,
            blurRadius: 216,
          ),
        ],
      ),
    );
  }
}

@immutable
final class _LimitedOfferBonusCircle extends StatelessWidget {
  const _LimitedOfferBonusCircle({
    required this.title,
    required this.svgPath,
    super.key,
  });

  final String title;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: SizeConstants.projectSquareBigButtonSize.width * .9,
          height: SizeConstants.projectSquareBigButtonSize.height * .9,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: context.colorScheme.onSurface.withOpacity(.2),
              width: .25,
            ),
            color: context.colorScheme.onSurface.withOpacity(.15),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF6F060B),
                blurRadius: 8.33,
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          child: Image.asset(
            svgPath,
            width: 24,
            height: 24,
          ),
        ),
        const Gap.normalHeight(),
        Text(
          title,
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.normal,
            color: context.colorScheme.onSurface,
            height: 1.2,
          ),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
