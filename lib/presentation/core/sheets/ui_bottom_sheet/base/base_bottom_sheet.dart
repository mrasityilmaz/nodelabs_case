part of '../ui_bottom_sheet.dart';

abstract class _BaseBottomSheetRoute<T> {
  const _BaseBottomSheetRoute({
    required this.context,
    required this.builder,
    required this.padding,
    this.dismissBehavior = const DragDownSheetKeyboardDismissBehavior(),
    this.maxExtent = 1,
    this.minExtent,
    this.initialExtent,
    this.resizeBehavior = const ResizeScaffoldBehavior.avoidBottomInset(maintainBottomBar: true),
    this.showDragHandle = true,
  });
  final BuildContext context;
  final WidgetBuilder builder;

  /// DismissBehavior controls the bottom sheet's dismiss when scroll down
  /// Default value is `DragDownSheetKeyboardDismissBehavior()`
  final SheetKeyboardDismissBehavior? dismissBehavior;

  /// Max Height of Bottom Sheet
  final double maxExtent;

  /// Min Height of Bottom Sheet
  final double? minExtent;

  /// Initial Height of Bottom Sheet
  final double? initialExtent;

  /// Resize Behavior of Bottom Sheet
  final ResizeScaffoldBehavior resizeBehavior;

  /// Show Drag Handle
  final bool showDragHandle;

  /// Padding of Bottom Sheet
  final EdgeInsetsGeometry padding;
}
