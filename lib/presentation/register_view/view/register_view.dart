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
import 'package:nodelabs_movie_case/presentation/register_view/bloc/register_bloc.dart';
import 'package:nodelabs_movie_case/presentation/register_view/bloc/register_event.dart';
import 'package:nodelabs_movie_case/presentation/register_view/bloc/register_state.dart';
import 'package:nodelabs_movie_case/presentation/register_view/models/models.dart';

part 'widgets/agreement_text.dart';
part 'widgets/input_fields.dart';
part 'widgets/login_button.dart';
part 'widgets/page_titles.dart';
part 'widgets/register_button.dart';

@immutable
@RoutePage()
final class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(context.read<UserBloc>()),
      child: BlocListener<RegisterBloc, RegisterViewState>(
        listener: _registerBlocListener,
        child: BlocBuilder<RegisterBloc, RegisterViewState>(
          buildWhen: (previous, current) => false,
          builder: (context, state) {
            return const _ScaffoldBody();
          },
        ),
      ),
    );
  }

  void _registerBlocListener(BuildContext context, RegisterViewState state) {
    if (state.status == FormzSubmissionStatus.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        ProjectSuccessSnackBar(context, errorMessage: 'User registered successfully!'),
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.router.replace(const LoginRoute());
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
            child: BusyBlocWrapper<RegisterBloc, RegisterViewState, Null>(
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
            const Gap.lowHeight(),
            const _AgreementText(),
            const Gap.highHeight(),
            const _RegisterButton(),
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
            const _LoginButton(),
          ],
        ),
      ),
    );
  }
}
