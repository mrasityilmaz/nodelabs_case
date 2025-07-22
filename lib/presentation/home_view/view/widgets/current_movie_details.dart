part of '../home_view.dart';

@immutable
final class _CurrentMovieDetails extends StatelessWidget {
  const _CurrentMovieDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentMovie = context.select<HomeBloc, MovieModel?>((bloc) => bloc.state.currentMovie);

    return TweenAnimationBuilder<double>(
      key: ValueKey(currentMovie?.id),
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 246),
      curve: Curves.decelerate,
      builder: (context, value, child) => AnimatedOpacity(
        opacity: value,
        duration: const Duration(milliseconds: 246),
        curve: Curves.decelerate,
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: currentMovie?.posterUrl ?? '',
              imageBuilder: (context, imageProvider) => CircleAvatar(
                radius: kMinInteractiveDimensionCupertino * .5,
                backgroundColor: context.colorScheme.surface,
                backgroundImage: imageProvider,
              ),
              errorWidget: (context, url, error) => CircleAvatar(
                radius: kMinInteractiveDimensionCupertino * .5,
                backgroundColor: context.colorScheme.surface,
                child: const Icon(Icons.person),
              ),
              placeholder: (context, url) => const SizedBox(
                width: kMinInteractiveDimensionCupertino,
                height: kMinInteractiveDimensionCupertino,
                child: Center(
                  child: Icon(Icons.person),
                ),
              ),
            ),
            const Gap.normalWidth(),
            Expanded(
              child: FractionallySizedBox(
                widthFactor: .9,
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      currentMovie?.title ?? '',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.onSurface,
                        height: 1,
                      ),
                    ),
                    const Gap.tinyHeight(),
                    Text(
                      currentMovie?.plot ?? '',
                      style: context.textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.normal,
                        color: context.colorScheme.onSurfaceVariant,
                        height: 1,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
