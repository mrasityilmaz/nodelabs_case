import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/core/mixins/bloc_mixin.dart';

@immutable
final class BusyBlocWrapper<B extends StateStreamable<S>, S, T extends BlocLoadableMixin?> extends StatelessWidget {
  const BusyBlocWrapper({required this.child, this.isBusySelector, super.key});
  final Widget child;
  final bool Function(S state)? isBusySelector;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<B, S, bool>(
      selector: (state) {
        return (isBusySelector?.call(state) ?? false) || state is T;
      },
      builder: (context, state) {
        return Stack(
          fit: StackFit.expand,
          children: [
            child,
            if (state) ...[
              const _BusyWidget(),
            ],
          ],
        );
      },
    );
  }
}

@immutable
final class _BusyWidget extends StatelessWidget {
  const _BusyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: context.colorScheme.surface.withOpacity(0.05),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
        child: ClipRRect(
          child: Center(
            child: SizedBox.square(
              dimension: 40,
              child: CircularProgressIndicator(
                color: context.colorScheme.primary,
                strokeCap: StrokeCap.round,
                strokeWidth: 3.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
