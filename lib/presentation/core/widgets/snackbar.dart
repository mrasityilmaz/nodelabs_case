import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';

@immutable
final class ProjectSuccessSnackBar extends SnackBar {
  ProjectSuccessSnackBar(this.context, {required this.errorMessage, super.key})
      : super(
          backgroundColor: Colors.green.shade700,
          content: Text(
            errorMessage,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.surface,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          shape: const RoundedRectangleBorder(),
        );

  final String errorMessage;

  final BuildContext context;
}

@immutable
final class ProjectErrorSnackBar extends SnackBar {
  ProjectErrorSnackBar(this.context, {required this.errorMessage, super.key})
      : super(
          backgroundColor: context.colorScheme.primary,
          content: Text(
            errorMessage,
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.colorScheme.primary.withOpacity(0.1),
            ),
          ),
        );

  final String errorMessage;

  final BuildContext context;
}
