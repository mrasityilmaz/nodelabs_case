import 'package:auto_route/auto_route.dart';
import 'package:nodelabs_movie_case/config/router/splash_guard.dart';
import 'package:nodelabs_movie_case/presentation/home_view/view/home_view.dart';
import 'package:nodelabs_movie_case/presentation/login_view/view/login_view.dart';
import 'package:nodelabs_movie_case/presentation/main_view/view/main_view.dart';
import 'package:nodelabs_movie_case/presentation/profile_view/view/profile_view.dart';
import 'package:nodelabs_movie_case/presentation/register_view/view/register_view.dart';
import 'package:nodelabs_movie_case/presentation/sheets/limited_offer_bottom_sheet/limited_offer_bottom_sheet_view.dart';
import 'package:nodelabs_movie_case/presentation/upload_photo_view/view/upload_photo_view.dart';
import 'package:smooth_sheets/smooth_sheets.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: AppRouter._replaceRouteName,
)
final class AppRouter extends RootStackRouter {
  factory AppRouter.create(SplashGuard splashGuard) => AppRouter._(splashGuard);
  AppRouter._(this._splashGuard);

  final SplashGuard _splashGuard;

  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page, initial: true, guards: [_splashGuard]),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(
          page: MainRoute.page,
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(page: UploadPhotoRoute.page),
        CustomRoute<void>(
          page: LimitedOfferBottomSheetRoute.page,
          customRouteBuilder: <T>(context, child, page) {
            return LimitedOfferBottomSheetView.createBottomSheetRoute(
              context,
              settings: page,
            ) as ModalSheetRoute<T>;
          },
        ),
      ];
}
