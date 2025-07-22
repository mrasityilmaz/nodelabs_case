import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nodelabs_movie_case/assets.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/radius_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/size_constants.dart';

@immutable
final class ProjectTextFieldDecoration extends InputDecoration {
  ProjectTextFieldDecoration({
    required BuildContext context,
    super.hintText,
    this.onObscurePressed,
    this.prefixIconPath,
    super.errorText,
    this.prefixIconSize = const Size.square(SizeConstants.medium * .8),
  }) : super(
          contentPadding: const PaddingConstants.mediumHorizontal(),
          counter: const Offstage(),
          hintStyle: context.textTheme.labelMedium?.copyWith(
            color: context.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.normal,
          ),
          fillColor: context.colorScheme.surfaceContainer,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: RadiusConstants.projectRadius(),
            borderSide: BorderSide(
              color: context.colorScheme.outline,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: RadiusConstants.projectRadius(),
            borderSide: BorderSide(
              color: context.colorScheme.onSurface,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: RadiusConstants.projectRadius(),
            borderSide: BorderSide(
              color: context.colorScheme.error,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: RadiusConstants.projectRadius(),
            borderSide: BorderSide(
              color: context.colorScheme.error,
            ),
          ),
          prefixIconConstraints: BoxConstraints.tight(
            const Size.square(SizeConstants.projectButtonHeight),
          ),
          prefixIcon: prefixIconPath != null
              ? Align(
                  widthFactor: 1,
                  heightFactor: 1,
                  alignment: const Alignment(.3, 0),
                  child: SvgPicture.asset(
                    prefixIconPath,
                    width: prefixIconSize.width,
                    height: prefixIconSize.height,
                    colorFilter: ColorFilter.mode(
                      context.colorScheme.onSurface,
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,
          suffixIcon: onObscurePressed != null
              ? Padding(
                  padding: const PaddingConstants.lowRight(),
                  child: IconButton(
                    onPressed: onObscurePressed,
                    icon: SvgPicture.asset(
                      Assets.icons.hide_icon_svg,
                      width: SizeConstants.medium,
                      colorFilter: ColorFilter.mode(
                        context.colorScheme.onSurface,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              : null,
        );

  /// If provided, a prefix icon will be shown.
  final String? prefixIconPath;

  /// If `prefixIconPath` is provided, this size will be used to set the size of the prefix icon.
  final Size prefixIconSize;

  /// If provided, a suffix icon will be shown and the user can toggle the visibility of the textfield.
  final VoidCallback? onObscurePressed;
}
