import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nodelabs_movie_case/assets.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_event.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_state.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/l10n/generated/app_localizations.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/gap_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/radius_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/app_bar.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/buttons/circle_icon_button.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/progress_indicator.dart';

part 'widgets/page_titles.dart';
part 'widgets/upload_photo_app_bar.dart';

@immutable
@RoutePage()
final class UploadPhotoView extends StatelessWidget {
  const UploadPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>.value(
      value: context.read<UserBloc>(),
      child: const Scaffold(
        appBar: _UploadPhotoAppBar(),
        body: SafeArea(
          minimum: PaddingConstants.screenPadding(),
          child: Column(
            children: [
              _PageTitles(),
              Gap.highHeight(),
              Expanded(child: _UploadPhotoSection()),
              Gap.normalHeight(),
              _ExitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

@immutable
final class _UploadPhotoSection extends StatelessWidget {
  const _UploadPhotoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: BlocListener<UserBloc, UserState>(
        listenWhen: (previous, current) {
          return previous.selectedImagePath != current.selectedImagePath || previous != current;
        },
        listener: (context, state) {
          if (state is UserSuccessfullyUpdatedProfilePhotoState) {
            context.router.maybePop();
          }
        },
        bloc: context.read<UserBloc>(),
        child: BlocSelector<UserBloc, UserState, ({String? imagePath, bool isLoading})>(
          selector: (state) => (
            imagePath: state.selectedImagePath,
            isLoading: state.isLoading,
          ),
          bloc: context.read<UserBloc>(),
          builder: (context, state) => InkWell(
            onTap: () {
              context.read<UserBloc>().add(const UserPhotoUpdateRequested());
            },
            borderRadius: const RadiusConstants.allMedium(),
            child: AnimatedContainer(
              duration: Durations.medium1,
              decoration: BoxDecoration(
                color: context.colorScheme.surfaceContainer,
                borderRadius: const RadiusConstants.allMedium(),
                border: Border.all(
                  color: context.colorScheme.outline,
                ),
                image: (state.imagePath != null && state.imagePath!.isNotEmpty)
                    ? DecorationImage(
                        image: FileImage(File(state.imagePath!)),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              constraints: BoxConstraints.tight(Size.square(MediaQuery.sizeOf(context).width * .4)),
              child: state.isLoading
                  ? const ProjectProgressIndicator()
                  : state.imagePath == null
                      ? const _NoImagePlusIcon()
                      : const SizedBox(),
            ),
          ),
        ),
      ),
    );
  }
}

class _NoImagePlusIcon extends StatelessWidget {
  const _NoImagePlusIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .6,
      heightFactor: .6,
      child: FittedBox(
        child: SvgPicture.asset(
          Assets.icons.plus_icon_svg,
          colorFilter: ColorFilter.mode(
            context.colorScheme.onSurfaceVariant,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

@immutable
final class _ExitButton extends StatelessWidget {
  const _ExitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              context.read<UserBloc>().add(const UserLogoutRequested());
            },
            style: context.buttonStyles.textPrimaryFilledStyle,
            child: Text(
              'Çıkış Yap',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
