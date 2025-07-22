part of '../home_view.dart';

@immutable
final class _MovieScrollingSection extends StatelessWidget {
  const _MovieScrollingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeBloc>();
    final movies = context.select<HomeBloc, List<MovieModel>>((bloc) => bloc.state.movies.movies);

    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        final divide = notification.metrics.pixels / notification.metrics.viewportDimension;

        final fetch = (movies.length - divide) < 3;

        if (fetch && !bloc.state.isLoadingMore && !bloc.state.isLoading) {
          context.read<HomeBloc>().add(const HomeFetchMoviesEvent());
        }
        return false;
      },
      child: EasyRefresh.builder(
        controller: bloc.easyRefreshController,
        onRefresh: () async {
          bloc.add(const HomeInitialEvent());
        },
        onLoad: () async {
          bloc.add(const HomeFetchMoviesEvent());
        },
        header: ClassicHeader(
          hapticFeedback: true,
          showMessage: false,
          showText: false,
          iconTheme: context.theme.iconTheme.copyWith(
            color: context.colorScheme.primary,
          ),
        ),
        childBuilder: (context, physics) {
          if (movies.isEmpty) {
            return const SizedBox.shrink();
          }
          return PageView.builder(
            key: const PageStorageKey('movie_scrollable'),
            physics: physics,
            allowImplicitScrolling: true,
            onPageChanged: (index) {
              final movie = movies[index % movies.length];
              context.read<HomeBloc>().add(HomeMovieShowEvent(movie: movie));
            },
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final movie = movies[index % movies.length];
              return MoviePosterImage(
                movie: movie,
                key: Key(movie.id.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
