// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

@immutable
class Routes {
  const Routes._();
  static const String initialRoute = AppRootScreenRoute;
  static const String AppRootScreenRoute = 'app-root-screen';
  static const String AuthScreenRoute = 'auth-screen';
  static const String UserTypeScreenRoute = 'user-type-screen';
  static const String LoginEmailScreenRoute = 'login-email-screen';
  static const String LoginPhoneScreenRoute = 'login-phone-screen';
  static const String ForgotScreenRoute = 'forgot-screen';
  static const String ChangePasswordScreenRoute = 'change-password-screen';
  static const String RegisterScreenRoute = 'register-screen';
  static const String VerifyScreenRoute = 'verify-screen';
  static const String VerifyTwoFaScreenRoute = 'verify-two-fa-screen';
}
