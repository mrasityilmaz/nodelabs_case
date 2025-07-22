import 'package:nodelabs_movie_case/services/network_manager/base_models/base_request_model.dart';
import 'package:vexana/vexana.dart';

enum ApiPaths {
  // ------------------------------------------------------------
  // MARK: - User paths
  // ------------------------------------------------------------

  login('/$_user/login', requestType: RequestType.POST),

  register('/$_user/register', requestType: RequestType.POST),

  profile('/$_user/profile', isAuthorized: true),

  uploadPhoto('/$_user/upload_photo', requestType: RequestType.POST, isAuthorized: true),

  // ------------------------------------------------------------
  // MARK: - Movies paths
  // ------------------------------------------------------------

  /// Params: movieId
  toggleMovieFavorite('/$_movie/favorite/{movieId}', requestType: RequestType.POST, isAuthorized: true),

  favoriteMovies('/$_movie/favorites', isAuthorized: true),

  movieList('/$_movie/list', isAuthorized: true);

  const ApiPaths(this.path, {this.requestType = RequestType.GET, this.isAuthorized = false});

  // ------------------------------------------------------------
  // MARK: - Prefixes
  // ------------------------------------------------------------

  static const String _user = 'user';

  static const String _movie = 'movie';

  /// It is used to get the default headers for the request.
  /// Value isAuthorized is used to determine if the request is authorized.
  Map<String, dynamic> get defaultHeaders {
    if (isAuthorized) {
      return BaseRequestModel.getBearerDefaultHeader;
    }
    return {};
  }

  final String path;
  final RequestType requestType;
  final bool isAuthorized;
}
