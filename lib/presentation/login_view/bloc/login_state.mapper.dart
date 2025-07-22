// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'login_state.dart';

class LoginViewStateMapper extends ClassMapperBase<LoginViewState> {
  LoginViewStateMapper._();

  static LoginViewStateMapper? _instance;
  static LoginViewStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LoginViewStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LoginViewState';

  static FormzSubmissionStatus _$status(LoginViewState v) => v.status;
  static const Field<LoginViewState, FormzSubmissionStatus> _f$status =
      Field('status', _$status, opt: true, def: FormzSubmissionStatus.initial);
  static LoginEmail _$email(LoginViewState v) => v.email;
  static const Field<LoginViewState, LoginEmail> _f$email =
      Field('email', _$email, opt: true, def: const LoginEmail.pure());
  static LoginPassword _$password(LoginViewState v) => v.password;
  static const Field<LoginViewState, LoginPassword> _f$password =
      Field('password', _$password, opt: true, def: const LoginPassword.pure());
  static bool _$obscurePassword(LoginViewState v) => v.obscurePassword;
  static const Field<LoginViewState, bool> _f$obscurePassword = Field(
      'obscurePassword', _$obscurePassword,
      key: r'obscure_password', opt: true, def: true);
  static bool _$isValid(LoginViewState v) => v.isValid;
  static const Field<LoginViewState, bool> _f$isValid =
      Field('isValid', _$isValid, key: r'is_valid', opt: true, def: false);
  static String? _$errorMessage(LoginViewState v) => v.errorMessage;
  static const Field<LoginViewState, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, key: r'error_message', opt: true);

  @override
  final MappableFields<LoginViewState> fields = const {
    #status: _f$status,
    #email: _f$email,
    #password: _f$password,
    #obscurePassword: _f$obscurePassword,
    #isValid: _f$isValid,
    #errorMessage: _f$errorMessage,
  };

  static LoginViewState _instantiate(DecodingData data) {
    return LoginViewState(
        status: data.dec(_f$status),
        email: data.dec(_f$email),
        password: data.dec(_f$password),
        obscurePassword: data.dec(_f$obscurePassword),
        isValid: data.dec(_f$isValid),
        errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin LoginViewStateMappable {
  LoginViewStateCopyWith<LoginViewState, LoginViewState, LoginViewState>
      get copyWith => _LoginViewStateCopyWithImpl(
          this as LoginViewState, $identity, $identity);
}

extension LoginViewStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LoginViewState, $Out> {
  LoginViewStateCopyWith<$R, LoginViewState, $Out> get $asLoginViewState =>
      $base.as((v, t, t2) => _LoginViewStateCopyWithImpl(v, t, t2));
}

abstract class LoginViewStateCopyWith<$R, $In extends LoginViewState, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {FormzSubmissionStatus? status,
      LoginEmail? email,
      LoginPassword? password,
      bool? obscurePassword,
      bool? isValid,
      String? errorMessage});
  LoginViewStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LoginViewStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LoginViewState, $Out>
    implements LoginViewStateCopyWith<$R, LoginViewState, $Out> {
  _LoginViewStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LoginViewState> $mapper =
      LoginViewStateMapper.ensureInitialized();
  @override
  $R call(
          {FormzSubmissionStatus? status,
          LoginEmail? email,
          LoginPassword? password,
          bool? obscurePassword,
          bool? isValid,
          Object? errorMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (email != null) #email: email,
        if (password != null) #password: password,
        if (obscurePassword != null) #obscurePassword: obscurePassword,
        if (isValid != null) #isValid: isValid,
        if (errorMessage != $none) #errorMessage: errorMessage
      }));
  @override
  LoginViewState $make(CopyWithData data) => LoginViewState(
      status: data.get(#status, or: $value.status),
      email: data.get(#email, or: $value.email),
      password: data.get(#password, or: $value.password),
      obscurePassword: data.get(#obscurePassword, or: $value.obscurePassword),
      isValid: data.get(#isValid, or: $value.isValid),
      errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  LoginViewStateCopyWith<$R2, LoginViewState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LoginViewStateCopyWithImpl($value, $cast, t);
}
