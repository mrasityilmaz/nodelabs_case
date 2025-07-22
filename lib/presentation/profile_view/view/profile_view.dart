import 'package:auto_route/auto_route.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nodelabs_movie_case/assets.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';
import 'package:nodelabs_movie_case/l10n/generated/app_localizations.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/gap_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/radius_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/size_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/app_bar.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/buttons/circle_icon_button.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/movie_widgets/movie_poster_image.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/progress_indicator.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/user_widgets/profile_mini_header.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_bloc.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_event.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/bloc/profile_state.dart';

part 'widgets/favorite_movie_grid.dart';
part 'widgets/favorite_movies_section.dart';
part 'widgets/profile_app_bar.dart';

@immutable
@RoutePage()
final class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const _ProfileAppBar(),
      body: Padding(
        padding: const PaddingConstants.screenPaddingHorizontal() + const PaddingConstants.screenPaddingTop(),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap.lowHeight(),
            UserProfileMiniHeader(),
            Gap.highHeight(),
            Expanded(child: _FavoriteMovieSection()),
          ],
        ),
      ),
    );
  }
}
