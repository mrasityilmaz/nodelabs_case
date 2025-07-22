import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/presentation/core/decorations/textfield_decoration.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/size_constants.dart';

@immutable
final class ProjectTextField extends TextField {
  ProjectTextField({
    required BuildContext context,
    required this.hintText,
    super.key,
    this.prefixIconPath,
    this.prefixIconSize = const Size.square(SizeConstants.medium * .8),
    this.onObscurePressed,
    super.controller,
    super.focusNode,
    super.undoController,
    super.keyboardType,
    super.textInputAction,
    super.textCapitalization = TextCapitalization.none,
    TextStyle? style,
    super.strutStyle,
    super.textAlign = TextAlign.start,
    super.textAlignVertical = TextAlignVertical.center,
    super.textDirection,
    super.readOnly = false,
    super.autofocus = false,
    super.obscuringCharacter = '•',
    super.obscureText = false,
    super.autocorrect = true,
    super.maxLines = 1,
    super.minLines,
    super.expands = false,
    super.maxLength,
    super.maxLengthEnforcement,
    super.onChanged,
    super.onEditingComplete,
    super.inputFormatters,
    this.errorText,
    super.enabled,
    super.keyboardAppearance,
    super.scrollPadding = const EdgeInsets.all(20),
    super.dragStartBehavior = DragStartBehavior.start,
    super.onTap,
    super.onTapAlwaysCalled = false,
    super.autofillHints = const <String>[],
  }) : super(
          style: style ??
              context.textTheme.bodyMedium?.copyWith(
                color: context.colorScheme.onSurface,
                fontWeight: FontWeight.normal,
              ),
          cursorColor: context.colorScheme.onSurface,
          decoration: ProjectTextFieldDecoration(
            context: context,
            hintText: hintText,
            prefixIconPath: prefixIconPath,
            onObscurePressed: onObscurePressed,
            prefixIconSize: prefixIconSize,
            errorText: errorText,
          ),
        );

  final String hintText;
  final String? prefixIconPath;
  final Size prefixIconSize;
  final VoidCallback? onObscurePressed;
  final String? errorText;
}
