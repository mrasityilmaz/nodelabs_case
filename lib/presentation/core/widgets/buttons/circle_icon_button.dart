import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/size_constants.dart';

@immutable
final class CircleIconButton extends StatelessWidget {
  const CircleIconButton({required this.icon, required this.onPressed, super.key});

  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: context.buttonStyles.iconActionStyle.copyWith(
        foregroundColor: WidgetStatePropertyAll(context.colorScheme.onSurface),
        backgroundColor: WidgetStatePropertyAll(context.colorScheme.surfaceContainer),
        iconSize: const WidgetStatePropertyAll(SizeConstants.medium),
        shape: WidgetStatePropertyAll(
          CircleBorder(
            side: BorderSide(
              color: context.colorScheme.outline,
            ),
          ),
        ),
        fixedSize: const WidgetStatePropertyAll(
          Size.square(
            kMinInteractiveDimensionCupertino,
          ),
        ),
        minimumSize: const WidgetStatePropertyAll(
          Size.square(
            kMinInteractiveDimensionCupertino,
          ),
        ),
        maximumSize: const WidgetStatePropertyAll(
          Size.square(
            kMinInteractiveDimensionCupertino,
          ),
        ),
      ),
    );
  }
}
