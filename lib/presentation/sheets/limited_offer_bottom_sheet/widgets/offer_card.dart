part of '../limited_offer_bottom_sheet_view.dart';

@immutable
final class _OfferCard extends StatelessWidget {
  const _OfferCard({
    required this.originalPrice,
    required this.currentPrice,
    required this.discount,
    required this.weeklyPrice,
    required this.gradientColors,
    super.key,
  });

  final String originalPrice;
  final String currentPrice;
  final String discount;

  final String weeklyPrice;
  final List<Color> gradientColors;

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: context.colorScheme.onSurface.withOpacity(.4),
              ),
              borderRadius: const RadiusConstants.allNormal(),
              gradient: RadialGradient(
                colors: gradientColors,
                center: Alignment.topLeft,
                radius: constraints.maxHeight * .008,
              ),
            ),
            padding: const PaddingConstants.allNormal(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        originalPrice,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Text(
                        currentPrice,
                        style: context.textTheme.headlineLarge?.copyWith(
                          color: context.colorScheme.onSurface,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        locale.coin,
                        style: context.textTheme.bodyLarge?.copyWith(
                          color: context.colorScheme.onSurface,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: context.colorScheme.surfaceContainer,
                  thickness: 1,
                  height: 0,
                ),
                const Gap.normalHeight(),
                Text(
                  weeklyPrice,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  locale.weekly_bonus,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          //    // Discount badge
          Positioned(
            child: Align(
              alignment: const Alignment(0, -1.1),
              child: Container(
                decoration: ShapeDecoration(
                  shape: StadiumBorder(
                    side: BorderSide(
                      color: context.colorScheme.surfaceContainer,
                    ),
                  ),
                  gradient: RadialGradient(
                    colors: gradientColors,
                    center: Alignment.topLeft,
                    radius: constraints.maxHeight,
                  ),
                ),
                padding: const PaddingConstants.lowHorizontal() * 1.25 + const PaddingConstants.tinyVertical() * .5,
                child: Text(
                  discount,
                  textAlign: TextAlign.center,
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.onSurface,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
