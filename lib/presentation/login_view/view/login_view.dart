import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:nodelabs_movie_case/assets.dart';
import 'package:nodelabs_movie_case/bloc/user_bloc/user_bloc.dart';
import 'package:nodelabs_movie_case/config/router/app_router.dart';
import 'package:nodelabs_movie_case/core/extensions/context_extension.dart';
import 'package:nodelabs_movie_case/l10n/generated/app_localizations.dart';
import 'package:nodelabs_movie_case/presentation/core/inputs/textfield.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/gap_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/view_constants/padding_constants.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/buttons/social_login_button.dart';
import 'package:nodelabs_movie_case/presentation/core/widgets/snackbar.dart';
import 'package:nodelabs_movie_case/presentation/core/wrappers/busy_bloc_wrapper.dart';
import 'package:nodelabs_movie_case/presentation/core/wrappers/hide_keyboard_body.dart';
import 'package:nodelabs_movie_case/presentation/login_view/bloc/login_bloc.dart';
import 'package:nodelabs_movie_case/presentation/login_view/bloc/login_event.dart';
import 'package:nodelabs_movie_case/presentation/login_view/bloc/login_state.dart';
import 'package:nodelabs_movie_case/presentation/login_view/models/email.dart';
import 'package:nodelabs_movie_case/presentation/login_view/models/password.dart';

part 'widgets/forgot_password_buttton.dart';
part 'widgets/input_fields.dart';
part 'widgets/login_button.dart';
part 'widgets/page_titles.dart';
part 'widgets/register_button.dart';

@immutable
@RoutePage()
final class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context.read<UserBloc>()),
      child: BlocListener<LoginBloc, LoginViewState>(
        listener: _loginBlocListener,
        child: BlocBuilder<LoginBloc, LoginViewState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            return const _ScaffoldBody();
          },
        ),
      ),
    );
  }

  void _loginBlocListener(BuildContext context, LoginViewState state) {
    if (state.status == FormzSubmissionStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        ProjectSuccessSnackBar(context, errorMessage: 'User logged in successfully!'),
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.router.pushAndPopUntil(const MainRoute(), predicate: (route) => false);
      });
    }
    if (state.status == FormzSubmissionStatus.failure && state.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        ProjectErrorSnackBar(context, errorMessage: state.errorMessage!),
      );
    }
  }
}

@immutable
final class _ScaffoldBody extends StatelessWidget {
  const _ScaffoldBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: true,
            child: BusyBlocWrapper<LoginBloc, LoginViewState, Null>(
              child: const _Body(),
              isBusySelector: (state) => state.status == FormzSubmissionStatus.inProgress,
            ),
          ),
        ],
      ),
    );
  }
}

@immutable
final class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HideKeyboardBody(
      child: SafeArea(
        minimum: const PaddingConstants.screenPadding(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const _PageTitles(),
            const Gap.highHeight() * 2,
            const _InputFields(),
            const Gap.mediumHeight(),
            const _ForgotPasswordButton(),
            const Gap.normalHeight(),
            const _LoginButton(),
            const Gap.highHeight(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialLoginButton.google(),
                const Gap.lowWidth(),
                SocialLoginButton.apple(),
                const Gap.lowWidth(),
                SocialLoginButton.facebook(),
              ],
            ),
            const Gap.highHeight(),
            const _RegisterButton(),
          ],
        ),
      ),
    );
  }
}
