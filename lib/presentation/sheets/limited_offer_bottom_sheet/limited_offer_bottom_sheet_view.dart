import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/assets.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/l10n/generated/app_localizations.dart';
import 'package:nodelabs_movie_case/presentation/core/sheets/ui_bottom_sheet/ui_bottom_sheet.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/gap_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/radius_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/size_constants.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

part 'widgets/offer_card.dart';
part 'widgets/offer_card_section.dart';
part 'widgets/offer_circles.dart';
part 'widgets/page_titles.dart';
part 'widgets/show_all_button.dart';

@immutable
@RoutePage()
class LimitedOfferBottomSheetView extends StatelessWidget {
  const LimitedOfferBottomSheetView({super.key});

  static ModalSheetRoute<void> createBottomSheetRoute(BuildContext context, {RouteSettings? settings}) {
    return UIBottomSheet.createBottomSheetRoute<void>(
      context,
      builder: (context) => const LimitedOfferBottomSheetView(),
      backgroundWidget: (child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2, sigmaY: 5),
        child: child,
      ),
      padding: EdgeInsets.zero,
      settings: settings,
      barrierColor: context.colorScheme.primary.withOpacity(.05),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -size.width * .15,
          left: 0,
          right: 0,
          child: const Align(
            alignment: Alignment.topCenter,
            child: _LimitedOfferBlurredCircle(),
          ),
        ),
        Positioned(
          bottom: -size.width * .15,
          left: 0,
          right: 0,
          child: const Align(
            alignment: Alignment.topCenter,
            child: _LimitedOfferBlurredCircle(),
          ),
        ),
        const Positioned(
          child: _Body(),
        ),
      ],
    );
  }
}

@immutable
final class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Padding(
      padding: const PaddingConstants.screenPadding(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _PageTitles(),
          const Gap.normalHeight(),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  context.colorScheme.onSurface.withOpacity(.1),
                  context.colorScheme.onSurface.withOpacity(.03),
                ],
              ),
              border: Border.all(
                color: context.colorScheme.surfaceContainer,
              ),
              borderRadius: const RadiusConstants.allMedium(),
            ),
            padding: const PaddingConstants.normalHorizontal() +
                const PaddingConstants.lowBottom() * 1.5 +
                const PaddingConstants.normalTop(),
            child: Column(
              children: [
                Text(
                  locale.offer_bonus_title,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: context.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Gap.normalHeight(),
                Row(
                  children: [
                    Expanded(
                      child: _LimitedOfferBonusCircle(
                        title: locale.offer_bonus_1,
                        svgPath: Assets.icons.bonus_gem_icon_png,
                      ),
                    ),
                    const Gap.normalWidth(),
                    Expanded(
                      child: _LimitedOfferBonusCircle(
                        title: locale.offer_bonus_2,
                        svgPath: Assets.icons.bonus_hearth_icon_png,
                      ),
                    ),
                    const Gap.normalWidth(),
                    Expanded(
                      child: _LimitedOfferBonusCircle(
                        title: locale.offer_bonus_3,
                        svgPath: Assets.icons.bonus_hearths_icon_png,
                      ),
                    ),
                    const Gap.normalWidth(),
                    Expanded(
                      child: _LimitedOfferBonusCircle(
                        title: locale.offer_bonus_4,
                        svgPath: Assets.icons.bonus_feature_icon_png,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap.mediumHeight(),
          Text(
            locale.choose_offer_to_unlock,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap.highHeight(),
          const Flexible(child: _OfferCardSection()),
          const Gap.normalHeight(),
          const _ShowAllOffersButton(),
        ],
      ),
    );
  }
}
