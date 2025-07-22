import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/gap_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';

@immutable
final class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({required this.title, super.key, this.actions = const [], this.leading});

  final String title;
  final Widget? leading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.colorScheme.surface,
      title: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (leading != null && context.router.canPop()) ...[
                  leading!,
                ],
              ],
            ),
          ),
          const Gap.normalWidth(),
          Expanded(
            child: Text(
              title,
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
          const Gap.normalWidth(),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (actions.isNotEmpty) ...[
                  ...actions,
                ],
              ],
            ),
          ),
        ],
      ),
      leadingWidth: 0,
      titleSpacing: const PaddingConstants.screenPaddingHorizontal().left,
      automaticallyImplyLeading: false,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
