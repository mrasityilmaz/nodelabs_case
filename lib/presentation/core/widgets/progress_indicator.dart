import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';

final class ProjectProgressIndicator extends StatelessWidget {
  const ProjectProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.colorScheme.primary,
        strokeCap: StrokeCap.round,
        strokeWidth: 2.5,
      ),
    );
  }
}
