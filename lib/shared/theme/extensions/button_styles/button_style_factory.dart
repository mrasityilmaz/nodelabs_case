part of '../../app_theme.dart';

/// {@macro DarkTextTheme}
/// {@macro LightTextTheme}
AppButtonStyles _createAppButtonStyles(ColorScheme colorScheme, TextTheme textTheme) {
  final BorderRadius defaultBorderRadius = RadiusConstants.projectRadius();
  const double defaultHeight = SizeConstants.projectButtonHeight;
  const Size defaultFixedSize = Size.fromHeight(defaultHeight);
  const Size squareFixedSize = Size.square(defaultHeight);
  const EdgeInsets textPadding = PaddingConstants.allLow();
  const EdgeInsets squareIconPadding = EdgeInsets.zero;
  const MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.shrinkWrap;

  final Color primaryColor = colorScheme.primary;
  final Color onPrimaryColor = colorScheme.onPrimary;
  final Color backgroundColor = colorScheme.surface;

  final TextStyle? buttonDefaultTextStyle = textTheme.bodyMedium?.copyWith(
    color: onPrimaryColor,
    fontWeight: FontWeight.w500,
  );
  final TextStyle? buttonSecondaryTextStyle = textTheme.bodyLarge?.copyWith(
    color: primaryColor,
    fontWeight: FontWeight.w500,
  );

  final RoundedRectangleBorder defaultShape = RoundedRectangleBorder(borderRadius: defaultBorderRadius);
  final BorderSide defaultOutlineBorderSide = BorderSide(color: colorScheme.outline);
  final RoundedRectangleBorder defaultOutlineShape = RoundedRectangleBorder(
    borderRadius: defaultBorderRadius,
    side: defaultOutlineBorderSide,
  );

  // TODO: Add disabled styles
  return AppButtonStyles(
    textPrimaryFilledStyle: TextButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
      disabledBackgroundColor: primaryColor.withOpacity(.25),
      disabledForegroundColor: onPrimaryColor.withOpacity(.5),
      textStyle: buttonDefaultTextStyle?.copyWith(color: onPrimaryColor),
      padding: textPadding,
      shape: defaultShape,
      fixedSize: defaultFixedSize,
      elevation: 0,
      tapTargetSize: tapTargetSize,
    ),
    textSecondaryOutlinedStyle: TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: colorScheme.onSurface,
      textStyle: buttonSecondaryTextStyle?.copyWith(color: primaryColor),
      padding: textPadding,
      shape: defaultOutlineShape,
      fixedSize: defaultFixedSize,
      tapTargetSize: tapTargetSize,
      elevation: 0,
    ),
    iconTextPrimaryFilledStyle: TextButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
      textStyle: buttonDefaultTextStyle?.copyWith(fontSize: 16, color: onPrimaryColor),
      padding: textPadding,
      shape: defaultShape,
      fixedSize: defaultFixedSize,
      elevation: 0,
      tapTargetSize: tapTargetSize,
    ),
    iconTextSecondaryOutlinedStyle: TextButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: primaryColor,
      textStyle: buttonSecondaryTextStyle?.copyWith(color: primaryColor),
      padding: textPadding,
      shape: defaultOutlineShape,
      fixedSize: defaultFixedSize,
      elevation: 0,
      tapTargetSize: tapTargetSize,
    ),
    iconSquareSecondaryOutlinedStyle: OutlinedButton.styleFrom(
      foregroundColor: primaryColor,
      backgroundColor: backgroundColor,
      side: defaultOutlineBorderSide,
      shape: defaultShape,
      padding: squareIconPadding,
      fixedSize: squareFixedSize,
      minimumSize: squareFixedSize,
      maximumSize: squareFixedSize,
      tapTargetSize: tapTargetSize,
      elevation: 0,
    ),
    iconSquarePrimaryFilledStyle: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: onPrimaryColor,
      shape: defaultShape,
      padding: squareIconPadding,
      fixedSize: squareFixedSize,
      minimumSize: squareFixedSize,
      maximumSize: squareFixedSize,
      tapTargetSize: tapTargetSize,
      elevation: 0,
    ),
    iconActionStyle: IconButton.styleFrom(
      foregroundColor: primaryColor,
      padding: const EdgeInsets.all(8),
      elevation: 0,
      visualDensity: VisualDensity.standard,
      tapTargetSize: tapTargetSize,
    ),
    destructiveTextOutlinedStyle: TextButton.styleFrom(
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.error,
      textStyle: buttonSecondaryTextStyle?.copyWith(fontSize: 16, color: colorScheme.error),
      padding: textPadding,
      shape: defaultOutlineShape.copyWith(side: BorderSide(color: colorScheme.error)),
      elevation: 0,
      fixedSize: defaultFixedSize,
      tapTargetSize: tapTargetSize,
    ),
    miniTransparentStyle: TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: primaryColor,
      textStyle: buttonSecondaryTextStyle?.copyWith(color: primaryColor),
      padding: textPadding,
      shape: defaultOutlineShape.copyWith(side: BorderSide.none),
      side: BorderSide.none,
      elevation: 0,
      tapTargetSize: tapTargetSize,
      minimumSize: Size.zero,
    ),
  );
}
