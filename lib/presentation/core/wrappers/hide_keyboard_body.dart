import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
final class HideKeyboardBody extends StatelessWidget {
  const HideKeyboardBody({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (details) {
        FocusManager.instance.primaryFocus?.unfocus();
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: child,
    );
  }
}
