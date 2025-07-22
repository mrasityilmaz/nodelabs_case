part of '../main_view.dart';

@immutable
final class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({
    required this.tabsRouter,
    super.key,
  });

  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
      ),
      child: Padding(
        padding: const PaddingConstants.lowBottom(),
        child: SafeArea(
          top: false,
          minimum: const PaddingConstants.screenPadding() + const PaddingConstants.screenPaddingHorizontal(),
          child: Builder(
            builder: (context) {
              return Row(
                children: [
                  Expanded(
                    child: _BottomNavigationButton(
                      onPressed: () {
                        tabsRouter.setActiveIndex(0);
                      },
                      label: locale.home,
                      icon: Assets.bottom_nav_bar_icons.home_icon_svg,
                      isActive: tabsRouter.activeIndex == 0,
                    ),
                  ),
                  const Gap.normalWidth(),
                  Expanded(
                    child: _BottomNavigationButton(
                      onPressed: () {
                        tabsRouter.setActiveIndex(1);
                      },
                      label: locale.profile,
                      icon: Assets.bottom_nav_bar_icons.profile_icon_svg,
                      isActive: tabsRouter.activeIndex == 1,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

@immutable
final class _BottomNavigationButton extends StatelessWidget {
  const _BottomNavigationButton({
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isActive = false,
    super.key,
  });
  final VoidCallback onPressed;
  final String label;
  final String icon;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: context.buttonStyles.miniTransparentStyle.copyWith(
        backgroundColor: WidgetStatePropertyAll(isActive ? context.colorScheme.primary : context.colorScheme.surface),
        padding: const WidgetStatePropertyAll(
          PaddingConstants.allLow(),
        ),
        shape: const WidgetStatePropertyAll(
          StadiumBorder(),
        ),
        side: WidgetStatePropertyAll(
          isActive
              ? BorderSide.none
              : BorderSide(
                  color: context.colorScheme.outline,
                ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: SizeConstants.medium * 1.1,
            height: SizeConstants.medium * 1.1,
          ),
          const Gap.lowWidth() * 1.25,
          Flexible(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                label,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: isActive ? context.colorScheme.onPrimary : context.colorScheme.onSurface,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
