import 'package:dart_mappable/dart_mappable.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';

part 'profile_state.mapper.dart';

@immutable
@MappableClass(
  generateMethods: GenerateMethods.copy | GenerateMethods.equals | GenerateMethods.encode,
)
final class ProfileState extends Equatable with ProfileStateMappable {
  const ProfileState({
    required this.favoriteMovies,
    this.isLoading = false,
    this.error,
  });

  factory ProfileState.initial() => const ProfileState(
        favoriteMovies: [],
      );

  ProfileState stopBusy() => copyWith(
        isLoading: false,
        error: null,
      );

  ProfileState onError(String? error) => copyWith(
        error: error,
        isLoading: false,
      );

  ProfileState onFavoriteMovies(List<MovieModel> fetchedMovies) => copyWith(
        favoriteMovies: fetchedMovies,
        isLoading: false,
        error: null,
      );

  final List<MovieModel> favoriteMovies;
  final bool isLoading;
  final String? error;

  @override
  List<Object?> get props => [
        favoriteMovies,
        isLoading,
        error,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      ...super.toJson()..removeWhere((key, value) => key == 'favorite_movies'),
      'favorite_movies': favoriteMovies.map((e) => '${e.id}|${e.title}|${e.isFavorite == true ? '👍' : '👎'}').toList(),
    };
  }
}
