part of '../home_view.dart';

@immutable
final class _LikeButton extends StatelessWidget {
  const _LikeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentMovie = context.select<HomeBloc, ({MovieModel? movie, bool isLikeBusy})>(
      (bloc) => (
        movie: bloc.state.currentMovie,
        isLikeBusy: bloc.state.isLikeBusy,
      ),
    );

    if (currentMovie.movie == null) return const SizedBox();
    return Padding(
      padding: const PaddingConstants.normalRight(),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: currentMovie.movie?.id != null && !currentMovie.isLikeBusy
              ? () {
                  context.read<HomeBloc>().add(HomeLikeMovieEvent(movieId: currentMovie.movie!.id!));
                }
              : null,
          icon: currentMovie.isLikeBusy
              ? const SizedBox.square(
                  dimension: SizeConstants.medium,
                  child: ProjectProgressIndicator(),
                )
              : Icon(
                  CupertinoIcons.heart_fill,
                  color: (currentMovie.movie?.isFavorite ?? false)
                      ? context.colorScheme.primary
                      : context.colorScheme.onSurface,
                ),
          style: context.buttonStyles.iconActionStyle.copyWith(
            padding: WidgetStatePropertyAll(
              const PaddingConstants.normalHorizontal() * .9 + const PaddingConstants.mediumVertical(),
            ),
            iconSize: const WidgetStatePropertyAll(
              SizeConstants.medium,
            ),
            backgroundBuilder: (context, states, child) {
              return ClipRRect(
                borderRadius: const BorderRadius.all(Radius.elliptical(100, 105)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.elliptical(100, 105)),
                      border: Border.all(
                        color: context.colorScheme.outline,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      color: context.colorScheme.surfaceContainerLow,
                    ),
                    child: child,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
