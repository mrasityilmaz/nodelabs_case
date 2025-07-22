import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_event.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_state.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/l10n/generated/app_localizations.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/index.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/progress_indicator.dart';

@immutable
final class UserProfileMiniHeader extends StatelessWidget {
  const UserProfileMiniHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserBloc, UserState, bool>(
      selector: (state) => state.user == null,
      builder: (context, isUserNull) {
        if (isUserNull == true) {
          return const Center(
            child: Text('User not found'),
          );
        }
        return const Row(
          children: [
            _UserAvatar(),
            Gap.lowWidth(),
            Expanded(
              child: _UserNameAndID(),
            ),
            Gap.normalWidth(),
            _AddPhotoButton(),
          ],
        );
      },
    );
  }
}

@immutable
class _UserNameAndID extends StatelessWidget {
  const _UserNameAndID({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.select<UserBloc, ({String? name, String? id})>(
      (bloc) => (name: bloc.state.user?.name, id: bloc.state.user?.id),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          user.name ?? 'Unknown',
          style: context.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: context.colorScheme.onSurface,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap.tinyHeight(),
        Text(
          "ID: ${user.id ?? 'Unknown'}",
          style: context.textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.normal,
            color: context.colorScheme.onSurfaceVariant,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

@immutable
class _UserAvatar extends StatelessWidget {
  const _UserAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<UserBloc, UserState, String?>(
      selector: (state) => state.user?.photoUrl,
      builder: (context, userPhotoUrl) {
        return CachedNetworkImage(
          imageUrl: userPhotoUrl ?? '',
          fit: BoxFit.cover,
          fadeInDuration: Durations.short1,
          fadeOutDuration: Durations.short1,
          placeholderFadeInDuration: Durations.short1,
          errorWidget: (context, error, stackTrace) => CircleAvatar(
            radius: SizeConstants.projectSquareBigButtonSize.height * 0.5,
            backgroundColor: context.colorScheme.surfaceContainer,
            child: Icon(
              Icons.no_accounts_rounded,
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: SizeConstants.projectSquareBigButtonSize.height * 0.5,
            backgroundImage: imageProvider,
            backgroundColor: context.colorScheme.surfaceContainer,
          ),
          progressIndicatorBuilder: (context, url, progress) => const ProjectProgressIndicator(),
        );
      },
    );
  }
}

@immutable
final class _AddPhotoButton extends StatelessWidget {
  const _AddPhotoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return TextButton(
      onPressed: () async {
        await context.router.push(const UploadPhotoRoute()).then((value) {
          if (context.mounted) {
            context.read<UserBloc>().add(const UserProfileLoadRequested());
          }
        });
      },
      style: context.buttonStyles.textPrimaryFilledStyle.copyWith(
        backgroundColor: WidgetStatePropertyAll(context.colorScheme.primary),
        fixedSize: const WidgetStatePropertyAll(Size.fromHeight(36)),
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: RadiusConstants.allLow(),
          ),
        ),
        padding: const WidgetStatePropertyAll(PaddingConstants.normalHorizontal()),
      ),
      child: Text(
        locale.add_photo,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: FontWeight.w700,
          color: context.colorScheme.onPrimary,
        ),
      ),
    );
  }
}
