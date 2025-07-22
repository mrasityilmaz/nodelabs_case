import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('tr')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @login_description.
  ///
  /// In en, this message translates to:
  /// **'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.'**
  String get login_description;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @welcome_description.
  ///
  /// In en, this message translates to:
  /// **'Tempus varius a vitae interdum id tortor elementum tristique eleifend at.'**
  String get welcome_description;

  /// No description provided for @nameSurname.
  ///
  /// In en, this message translates to:
  /// **'Name Surname'**
  String get nameSurname;

  /// No description provided for @nameSurname_required.
  ///
  /// In en, this message translates to:
  /// **'Name Surname field is required.'**
  String get nameSurname_required;

  /// No description provided for @nameSurname_min_length.
  ///
  /// In en, this message translates to:
  /// **'Name Surname field must be at least 3 characters.'**
  String get nameSurname_min_length;

  /// No description provided for @nameSurname_max_length.
  ///
  /// In en, this message translates to:
  /// **'Name Surname field must be at most 50 characters.'**
  String get nameSurname_max_length;

  /// No description provided for @nameSurname_invalid.
  ///
  /// In en, this message translates to:
  /// **'Name Surname field is invalid.'**
  String get nameSurname_invalid;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @email_required.
  ///
  /// In en, this message translates to:
  /// **'Email field is required.'**
  String get email_required;

  /// No description provided for @email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Email format is invalid.'**
  String get email_invalid;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @password_required.
  ///
  /// In en, this message translates to:
  /// **'Password field is required.'**
  String get password_required;

  /// No description provided for @password_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password field must be at least 8 characters.'**
  String get password_min_length;

  /// No description provided for @password_max_length.
  ///
  /// In en, this message translates to:
  /// **'Password field must be at most 20 characters.'**
  String get password_max_length;

  /// No description provided for @password_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation'**
  String get password_confirmation;

  /// No description provided for @password_weak.
  ///
  /// In en, this message translates to:
  /// **'Password is weak.'**
  String get password_weak;

  /// No description provided for @password_confirmation_required.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation field is required.'**
  String get password_confirmation_required;

  /// No description provided for @password_confirmation_min_length.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation field must be at least 8 characters.'**
  String get password_confirmation_min_length;

  /// No description provided for @password_confirmation_max_length.
  ///
  /// In en, this message translates to:
  /// **'Password Confirmation field must be at most 20 characters.'**
  String get password_confirmation_max_length;

  /// No description provided for @password_confirmation_not_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get password_confirmation_not_match;

  /// No description provided for @forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgot_password;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Dont have an account?'**
  String get dont_have_account;

  /// No description provided for @already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get already_have_account;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @register_now.
  ///
  /// In en, this message translates to:
  /// **'Register Now'**
  String get register_now;

  /// No description provided for @i_agree_to_the_terms_and_conditions.
  ///
  /// In en, this message translates to:
  /// **'I agree to the *terms and conditions.* By continuing, you agree to the terms and conditions.'**
  String get i_agree_to_the_terms_and_conditions;

  /// No description provided for @profile_detail.
  ///
  /// In en, this message translates to:
  /// **'Profile Detail'**
  String get profile_detail;

  /// No description provided for @upload_profile_photo.
  ///
  /// In en, this message translates to:
  /// **'Upload Your Photos'**
  String get upload_profile_photo;

  /// No description provided for @upload_profile_photo_description.
  ///
  /// In en, this message translates to:
  /// **'Resources out incentivize relaxation floor loss cc.'**
  String get upload_profile_photo_description;

  /// No description provided for @add_photo.
  ///
  /// In en, this message translates to:
  /// **'Add Photo'**
  String get add_photo;

  /// No description provided for @favorite_movies.
  ///
  /// In en, this message translates to:
  /// **'Favorite Movies'**
  String get favorite_movies;

  /// No description provided for @no_favorite_movies.
  ///
  /// In en, this message translates to:
  /// **'No favorite movies found.'**
  String get no_favorite_movies;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @limited_offer.
  ///
  /// In en, this message translates to:
  /// **'Limited Offer'**
  String get limited_offer;

  /// No description provided for @offer_description.
  ///
  /// In en, this message translates to:
  /// **'Choose a coin package to unlock new episodes and earn bonus!'**
  String get offer_description;

  /// No description provided for @offer_bonus_title.
  ///
  /// In en, this message translates to:
  /// **'Your Bonus'**
  String get offer_bonus_title;

  /// No description provided for @offer_bonus_1.
  ///
  /// In en, this message translates to:
  /// **'Premium Account'**
  String get offer_bonus_1;

  /// No description provided for @offer_bonus_2.
  ///
  /// In en, this message translates to:
  /// **'More Matches'**
  String get offer_bonus_2;

  /// No description provided for @offer_bonus_3.
  ///
  /// In en, this message translates to:
  /// **'Top Position'**
  String get offer_bonus_3;

  /// No description provided for @offer_bonus_4.
  ///
  /// In en, this message translates to:
  /// **'More Likes'**
  String get offer_bonus_4;

  /// No description provided for @choose_offer_to_unlock.
  ///
  /// In en, this message translates to:
  /// **'Choose a coin package to unlock new episodes and earn bonus!'**
  String get choose_offer_to_unlock;

  /// No description provided for @coin.
  ///
  /// In en, this message translates to:
  /// **'Coin'**
  String get coin;

  /// No description provided for @view_all_coins.
  ///
  /// In en, this message translates to:
  /// **'View All Coins'**
  String get view_all_coins;

  /// No description provided for @weekly_bonus.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly_bonus;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return SEn();
    case 'tr': return STr();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
