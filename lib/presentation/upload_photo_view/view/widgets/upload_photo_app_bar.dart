part of '../upload_photo_view.dart';

@immutable
final class _UploadPhotoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _UploadPhotoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    return ProjectAppBar(
      title: locale.profile_detail,
      leading: CircleIconButton(
        icon: const Icon(Icons.arrow_back_rounded),
        onPressed: () {
          context.router.maybePop();
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
