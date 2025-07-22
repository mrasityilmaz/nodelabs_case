part of '../profile_view.dart';



@immutable
final class _FavoriteMovieSection extends StatelessWidget {
  const _FavoriteMovieSection();

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          locale.favorite_movies,
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w700,
            color: context.colorScheme.onSurface,
          ),
        ),
        const Gap.normalHeight(),
        const Expanded(
          child: _FavoriteMoviesGrid(),
        ),
      ],
    );
  }
}
