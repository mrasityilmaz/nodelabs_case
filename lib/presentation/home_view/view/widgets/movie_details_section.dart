part of '../home_view.dart';

@immutable
final class _MovieDetailsSection extends StatelessWidget {
  const _MovieDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const _LikeButton(),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [context.colorScheme.surface, context.colorScheme.surface.withOpacity(0)],
            ),
          ),
          child: Padding(
            padding: const PaddingConstants.screenPaddingBottom() +
                const PaddingConstants.screenPaddingHorizontal() +
                const PaddingConstants.mediumTop() * .9,
            child: const _CurrentMovieDetails(),
          ),
        ),
      ],
    );
  }
}
