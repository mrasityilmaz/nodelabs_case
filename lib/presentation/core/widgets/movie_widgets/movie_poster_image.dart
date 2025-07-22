import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';

@immutable
final class MoviePosterImage extends StatelessWidget {
  const MoviePosterImage({
    required this.movie,
    this.borderRadius,
    super.key,
  });

  final MovieModel movie;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final posterUrl = movie.posterUrl ?? '';

    final image = CachedNetworkImage(
      imageUrl: posterUrl,
      cacheKey: '${movie.id}',
      fadeInDuration: Duration.zero,
      fadeOutDuration: Duration.zero,
      placeholderFadeInDuration: Durations.short2,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, progress) => Center(
        child: CircularProgressIndicator(
          color: context.colorScheme.primary,
          strokeCap: StrokeCap.round,
          strokeWidth: 2.5,
        ),
      ),
      errorWidget: (context, url, error) {
        if (url == movie.images?.lastOrNull) {
          return ColoredBox(
            color: context.colorScheme.surfaceContainer,
            child: Center(
              child: Icon(
                Icons.image_not_supported_outlined,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          );
        }

        return MoviePosterImage(
          borderRadius: borderRadius,
          movie: MovieModel.fromDTO(movie.copyWith(posterUrl: movie.getNextPosterUrl(url))),
        );
      },
    );

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius!,
        child: image,
      );
    }
    return image;
  }
}
