// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "app_name": "Bende Fazla",
  "form_fields": {
    "name": "First Name",
    "surname": "Last Name",
    "email": "Email",
    "password": "Password",
    "confirm_password": "Confirm Password",
    "phone_number": "Phone Number",
    "gender": "Gender",
    "select": "Select"
  },
  "auth": {
    "signup": "Sign Up",
    "signin": "Sign In",
    "create_account": "Create Account",
    "complete_your_profile": "Complete Your Profile",
    "forgot_password": "Forgot Password",
    "fill_your_info": "Fill out your information to register or try other methods.",
    "welcome_back": "Welcome back! You can continue where you left off by signing in.",
    "enter_your_personal_info": "Enter your personal information to complete the registration process.",
    "forgot_password_send_connection_link": "We need your registered email address to send the password reset link.",
    "apply_and_continue": "Apply and Continue",
    "or_with": "Or with",
    "already_have_an_account": "Already have an account?",
    "dont_have_an_account": "Don't have an account?"
  }
};
static const Map<String,dynamic> tr = {
  "app_name": "Bende Fazla",
  "form_fields": {
    "name": "Ad",
    "surname": "Soyad",
    "email": "E-posta",
    "password": "Şifre",
    "confirm_password": "Şifre Onay",
    "phone_number": "Telefon Numarası",
    "gender": "Cinsiyet",
    "select": "Seçim"
  },
  "auth": {
    "signup": "Kayıt Ol",
    "signin": "Giriş Yap",
    "create_account": "Hesap Oluştur",
    "complete_your_profile": "Profilini Tamamla",
    "forgot_password": "Şifremi Unuttum",
    "fill_your_info": "Kayıt olmak için bilgilerinizi doldurun veya diğer yöntemleri deneyin.",
    "welcome_back": "Tekrar hoşgeldiniz, giriş yaparak kaldığınız yerden devam edebilirsiniz.",
    "enter_your_personal_info": "Kayıt işlemini tamamlamak için kişisel bilgileriniz giriniz.",
    "forgot_password_send_connection_link": "Şifre sıfırlama bağlantısını gönderebilmemiz için hesabınıza kayıtlı e-posta adresinize ihtiyacımız var.",
    "apply_and_continue": "Onayla ve Devam et",
    "or_with": "Veya",
    "already_have_an_account": "Zaten bir hesabınız var mı?",
    "dont_have_an_account": "Hesabınız yok mu?"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
