// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'register_state.dart';

class RegisterViewStateMapper extends ClassMapperBase<RegisterViewState> {
  RegisterViewStateMapper._();

  static RegisterViewStateMapper? _instance;
  static RegisterViewStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RegisterViewStateMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'RegisterViewState';

  static FormzSubmissionStatus _$status(RegisterViewState v) => v.status;
  static const Field<RegisterViewState, FormzSubmissionStatus> _f$status =
      Field('status', _$status, opt: true, def: FormzSubmissionStatus.initial);
  static RegisterNameSurname _$nameSurname(RegisterViewState v) =>
      v.nameSurname;
  static const Field<RegisterViewState, RegisterNameSurname> _f$nameSurname =
      Field('nameSurname', _$nameSurname,
          key: r'name_surname',
          opt: true,
          def: const RegisterNameSurname.pure());
  static RegisterEmail _$email(RegisterViewState v) => v.email;
  static const Field<RegisterViewState, RegisterEmail> _f$email =
      Field('email', _$email, opt: true, def: const RegisterEmail.pure());
  static RegisterPassword _$password(RegisterViewState v) => v.password;
  static const Field<RegisterViewState, RegisterPassword> _f$password = Field(
      'password', _$password,
      opt: true, def: const RegisterPassword.pure());
  static RegisterConfirmPassword _$confirmPassword(RegisterViewState v) =>
      v.confirmPassword;
  static const Field<RegisterViewState, RegisterConfirmPassword>
      _f$confirmPassword = Field('confirmPassword', _$confirmPassword,
          key: r'confirm_password',
          opt: true,
          def: const RegisterConfirmPassword.pure());
  static bool _$obscurePassword(RegisterViewState v) => v.obscurePassword;
  static const Field<RegisterViewState, bool> _f$obscurePassword = Field(
      'obscurePassword', _$obscurePassword,
      key: r'obscure_password', opt: true, def: true);
  static bool _$obscureConfirmPassword(RegisterViewState v) =>
      v.obscureConfirmPassword;
  static const Field<RegisterViewState, bool> _f$obscureConfirmPassword = Field(
      'obscureConfirmPassword', _$obscureConfirmPassword,
      key: r'obscure_confirm_password', opt: true, def: true);
  static bool _$isValid(RegisterViewState v) => v.isValid;
  static const Field<RegisterViewState, bool> _f$isValid =
      Field('isValid', _$isValid, key: r'is_valid', opt: true, def: false);
  static String? _$errorMessage(RegisterViewState v) => v.errorMessage;
  static const Field<RegisterViewState, String> _f$errorMessage =
      Field('errorMessage', _$errorMessage, key: r'error_message', opt: true);

  @override
  final MappableFields<RegisterViewState> fields = const {
    #status: _f$status,
    #nameSurname: _f$nameSurname,
    #email: _f$email,
    #password: _f$password,
    #confirmPassword: _f$confirmPassword,
    #obscurePassword: _f$obscurePassword,
    #obscureConfirmPassword: _f$obscureConfirmPassword,
    #isValid: _f$isValid,
    #errorMessage: _f$errorMessage,
  };

  static RegisterViewState _instantiate(DecodingData data) {
    return RegisterViewState(
        status: data.dec(_f$status),
        nameSurname: data.dec(_f$nameSurname),
        email: data.dec(_f$email),
        password: data.dec(_f$password),
        confirmPassword: data.dec(_f$confirmPassword),
        obscurePassword: data.dec(_f$obscurePassword),
        obscureConfirmPassword: data.dec(_f$obscureConfirmPassword),
        isValid: data.dec(_f$isValid),
        errorMessage: data.dec(_f$errorMessage));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin RegisterViewStateMappable {
  RegisterViewStateCopyWith<RegisterViewState, RegisterViewState,
          RegisterViewState>
      get copyWith => _RegisterViewStateCopyWithImpl(
          this as RegisterViewState, $identity, $identity);
}

extension RegisterViewStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, RegisterViewState, $Out> {
  RegisterViewStateCopyWith<$R, RegisterViewState, $Out>
      get $asRegisterViewState =>
          $base.as((v, t, t2) => _RegisterViewStateCopyWithImpl(v, t, t2));
}

abstract class RegisterViewStateCopyWith<$R, $In extends RegisterViewState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {FormzSubmissionStatus? status,
      RegisterNameSurname? nameSurname,
      RegisterEmail? email,
      RegisterPassword? password,
      RegisterConfirmPassword? confirmPassword,
      bool? obscurePassword,
      bool? obscureConfirmPassword,
      bool? isValid,
      String? errorMessage});
  RegisterViewStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _RegisterViewStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, RegisterViewState, $Out>
    implements RegisterViewStateCopyWith<$R, RegisterViewState, $Out> {
  _RegisterViewStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<RegisterViewState> $mapper =
      RegisterViewStateMapper.ensureInitialized();
  @override
  $R call(
          {FormzSubmissionStatus? status,
          RegisterNameSurname? nameSurname,
          RegisterEmail? email,
          RegisterPassword? password,
          RegisterConfirmPassword? confirmPassword,
          bool? obscurePassword,
          bool? obscureConfirmPassword,
          bool? isValid,
          Object? errorMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (nameSurname != null) #nameSurname: nameSurname,
        if (email != null) #email: email,
        if (password != null) #password: password,
        if (confirmPassword != null) #confirmPassword: confirmPassword,
        if (obscurePassword != null) #obscurePassword: obscurePassword,
        if (obscureConfirmPassword != null)
          #obscureConfirmPassword: obscureConfirmPassword,
        if (isValid != null) #isValid: isValid,
        if (errorMessage != $none) #errorMessage: errorMessage
      }));
  @override
  RegisterViewState $make(CopyWithData data) => RegisterViewState(
      status: data.get(#status, or: $value.status),
      nameSurname: data.get(#nameSurname, or: $value.nameSurname),
      email: data.get(#email, or: $value.email),
      password: data.get(#password, or: $value.password),
      confirmPassword: data.get(#confirmPassword, or: $value.confirmPassword),
      obscurePassword: data.get(#obscurePassword, or: $value.obscurePassword),
      obscureConfirmPassword:
          data.get(#obscureConfirmPassword, or: $value.obscureConfirmPassword),
      isValid: data.get(#isValid, or: $value.isValid),
      errorMessage: data.get(#errorMessage, or: $value.errorMessage));

  @override
  RegisterViewStateCopyWith<$R2, RegisterViewState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _RegisterViewStateCopyWithImpl($value, $cast, t);
}
