part of '../profile_view.dart';

@immutable
final class _ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return ProjectAppBar(
      title: locale.profile_detail,
      leading: CircleIconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          context.router.maybePop();
        },
      ),
      actions: [
        Flexible(
          child: TextButton.icon(
            onPressed: () {
              context.router.push(const LimitedOfferBottomSheetRoute());
            },
            label: Text(
              locale.limited_offer,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            icon: SvgPicture.asset(
              Assets.icons.gem_icon_svg,
              width: SizeConstants.normal * 1.25,
              height: SizeConstants.normal * 1.25,
            ),
            style: context.buttonStyles.miniTransparentStyle.copyWith(
              backgroundColor: WidgetStatePropertyAll(context.colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
