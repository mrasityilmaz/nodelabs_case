import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nodelabs_movie_case/assets.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/size_constants.dart';

@immutable
final class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton._({required this.iconPath});

  SocialLoginButton.google() : this._(iconPath: Assets.icons.google_icon_svg);
  SocialLoginButton.apple() : this._(iconPath: Assets.icons.apple_icon_svg);
  SocialLoginButton.facebook() : this._(iconPath: Assets.icons.facebook_icon_svg);

  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: context.buttonStyles.iconSquareSecondaryOutlinedStyle.copyWith(
        foregroundColor: WidgetStateProperty.all(
          context.colorScheme.onSurface,
        ),
        backgroundColor: WidgetStateProperty.all(
          context.colorScheme.surfaceContainer,
        ),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: context.colorScheme.outline,
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(
          SizeConstants.projectSquareBigButtonSize,
        ),
        minimumSize: const WidgetStatePropertyAll(
          SizeConstants.projectSquareBigButtonSize,
        ),
        maximumSize: const WidgetStatePropertyAll(
          SizeConstants.projectSquareBigButtonSize,
        ),
      ),
      child: SvgPicture.asset(
        iconPath,
        width: SizeConstants.medium,
        height: SizeConstants.medium,
      ),
    );
  }
}
