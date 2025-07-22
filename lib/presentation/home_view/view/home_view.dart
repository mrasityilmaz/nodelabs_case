import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/domain/models/movie_model/movie_model.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/index.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/movie_widgets/movie_poster_image.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/progress_indicator.dart';
import 'package:nodelabs_movie_case/presentation/home_view/bloc/home_bloc.dart';
import 'package:nodelabs_movie_case/presentation/home_view/bloc/home_event.dart';

part 'widgets/current_movie_details.dart';
part 'widgets/like_button.dart';
part 'widgets/movie_details_section.dart';
part 'widgets/movie_scrollable.dart';

@immutable
@RoutePage()
final class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: _MovieScrollingSection(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: _MovieDetailsSection(),
            ),
          ],
        ),
      ),
    );
  }
}
