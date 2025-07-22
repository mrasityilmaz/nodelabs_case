part of '../ui_bottom_sheet.dart';

@immutable
final class _GeneralBody<T> extends StatelessWidget implements _BaseBottomSheetRoute<T> {
  const _GeneralBody({
    required this.context,
    required this.builder,
    super.key,
    this.dismissBehavior = const DragDownSheetKeyboardDismissBehavior(),
    this.maxExtent = 1,
    this.minExtent,
    this.initialExtent,
    this.resizeBehavior = const ResizeScaffoldBehavior.avoidBottomInset(maintainBottomBar: true),
    this.showDragHandle = true,
    this.padding = const PaddingConstants.screenPadding(),
  });

  @override
  final BuildContext context;
  @override
  final double maxExtent;
  @override
  final double? minExtent;
  @override
  final double? initialExtent;
  @override
  final ResizeScaffoldBehavior resizeBehavior;
  @override
  final bool showDragHandle;

  @override
  final SheetKeyboardDismissBehavior? dismissBehavior;
  @override
  final Widget Function(BuildContext ctx) builder;

  @override
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SheetKeyboardDismissible(
        // Dismiss Behavior of Bottom Sheet (When Child is Scrollable)
        dismissBehavior: dismissBehavior,
        child: ScrollableSheet(
          // Max Height of Bottom Sheet
          maxPosition: SheetAnchor.proportional(maxExtent),
          initialPosition: SheetAnchor.proportional(initialExtent ?? 1),
          minPosition: SheetAnchor.proportional(minExtent ?? 1),
          physics: kDefaultSheetPhysics,

          // Shape of Bottom Sheet
          child: ClipRRect(
            borderRadius: const RadiusConstants.highTop(),
            child: Material(
              color: context.colorScheme.surface,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: context.colorScheme.onTertiary.withOpacity(0.15),
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: const RadiusConstants.highTop(),
              ),
              child: SheetDraggable(
                behavior: HitTestBehavior.opaque,
                child: SheetContentScaffold(
                  backgroundColor: Colors.transparent,
                  resizeBehavior: resizeBehavior,
                  body: SafeArea(top: false, minimum: padding, child: builder(context)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
