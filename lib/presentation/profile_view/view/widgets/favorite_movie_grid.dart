part of '../profile_view.dart';

@immutable
final class _FavoriteMoviesGrid extends StatelessWidget {
  const _FavoriteMoviesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final bloc = context.read<ProfileBloc>();
    return BlocSelector<ProfileBloc, ProfileState, ({List<MovieModel> movies, bool isLoading})>(
      selector: (state) => (movies: state.favoriteMovies, isLoading: state.isLoading),
      builder: (context, stateValue) {
        return EasyRefresh.builder(
          controller: bloc.easyRefreshController,
          onRefresh: () async {
            bloc.add(const ProfileInitialEvent());
          },
          header: ClassicHeader(
            hapticFeedback: true,
            showMessage: false,
            showText: false,
            iconTheme: context.theme.iconTheme.copyWith(
              color: context.colorScheme.primary,
            ),
          ),
          childBuilder: (context, physics) => CustomScrollView(
            physics: physics,
            slivers: [
              if (stateValue.isLoading) ...[
                const SliverFillRemaining(
                  child: ProjectProgressIndicator(),
                ),
              ] else if (stateValue.movies.isEmpty) ...[
                SliverFillRemaining(
                  child: Center(
                    child: Text(locale.no_favorite_movies),
                  ),
                ),
              ] else ...[
                SliverGrid.builder(
                  itemCount: stateValue.movies.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 4.5,
                    crossAxisSpacing: SizeConstants.normal,
                    mainAxisSpacing: SizeConstants.normal * 1.25,
                  ),
                  itemBuilder: (context, index) {
                    final movie = stateValue.movies[index];
                    return _FavoriteMovieGridItem(movie: movie);
                  },
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

@immutable
final class _FavoriteMovieGridItem extends StatelessWidget {
  const _FavoriteMovieGridItem({required this.movie});

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MoviePosterImage(
            movie: movie,
            borderRadius: const RadiusConstants.allLow(),
          ),
        ),
        const Gap.normalHeight(),
        FractionallySizedBox(
          widthFactor: 0.8,
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movie.title ?? '',
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: context.colorScheme.onSurface,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                movie.director ?? movie.writer ?? '',
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.normal,
                  color: context.colorScheme.onSurfaceVariant,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
