import 'package:flutter/material.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/radius_constants.dart';
import 'package:provider/provider.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

part 'base/base_bottom_sheet.dart';
part 'bodies/general_body.dart';

final class UIBottomSheet {
  const UIBottomSheet._();

  static Future<T?> showBottomSheet<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    Key? key,
    bool isDismissible = true,
    SheetKeyboardDismissBehavior? dismissBehavior = const DragDownSheetKeyboardDismissBehavior(),
    double maxExtent = 1,
    double? minExtent,
    double? initialExtent,
    ResizeScaffoldBehavior resizeBehavior = const ResizeScaffoldBehavior.avoidBottomInset(maintainBottomBar: true),
    bool showDragHandle = true,
    Widget? backgroundWidget,
    EdgeInsets padding = const PaddingConstants.screenPadding(),
    Color? barrierColor,
  }) async {
    return context.read<AppRouter>().pushNativeRoute<T>(
          ModalSheetRoute(
            barrierColor: barrierColor,
            builder: (context) {
              return _GeneralBody<T>(
                context: context,
                builder: builder,
                dismissBehavior: dismissBehavior,
                maxExtent: maxExtent,
                minExtent: minExtent,
                initialExtent: initialExtent,
                resizeBehavior: resizeBehavior,
                showDragHandle: showDragHandle,
                key: key,
                padding: padding,
              );
            },
            barrierDismissible: isDismissible,
            swipeDismissible: isDismissible,
          ),
        );
  }

  static ModalSheetRoute<T?> createBottomSheetRoute<T>(
    BuildContext context, {
    required WidgetBuilder builder,
    Key? key,
    bool isDismissible = true,
    SheetKeyboardDismissBehavior? dismissBehavior = const DragDownSheetKeyboardDismissBehavior(),
    double maxExtent = 1,
    double? minExtent,
    double? initialExtent,
    ResizeScaffoldBehavior resizeBehavior = const ResizeScaffoldBehavior.avoidBottomInset(maintainBottomBar: true),
    bool showDragHandle = true,
    Widget? Function(Widget child)? backgroundWidget,
    EdgeInsets padding = const PaddingConstants.screenPadding(),
    RouteSettings? settings,
    Color? barrierColor,
  }) {
    return ModalSheetRoute<T>(
      settings: settings,
      barrierColor: barrierColor,
      builder: (context) {
        return backgroundWidget?.call(
              _GeneralBody<T>(
                context: context,
                builder: builder,
                dismissBehavior: dismissBehavior,
                maxExtent: maxExtent,
                minExtent: minExtent,
                initialExtent: initialExtent,
                resizeBehavior: resizeBehavior,
                showDragHandle: showDragHandle,
                key: key,
                padding: padding,
              ),
            ) ??
            _GeneralBody<T>(
              context: context,
              builder: builder,
              dismissBehavior: dismissBehavior,
            );
      },
      barrierDismissible: isDismissible,
      swipeDismissible: isDismissible,
    );
  }
}
