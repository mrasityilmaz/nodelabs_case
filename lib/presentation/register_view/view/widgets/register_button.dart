part of '../register_view.dart';

@immutable
final class _RegisterButton extends StatelessWidget {
  const _RegisterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final locale = S.of(context);
    final state = context.read<RegisterBloc>();
    return TextButton(
      onPressed: () {
        state.add(const RegisterViewRegisterPressed());
      },
      style: context.buttonStyles.textPrimaryFilledStyle,
      child: Center(
        child: Text(
          locale.register_now,
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
