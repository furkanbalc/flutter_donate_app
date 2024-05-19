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
  "validator": {
    "upper_case_validator": "Must contain at least one uppercase letter (A-Z)",
    "digit_validator": "Must contain at least one digit (0-9)",
    "special_char_validator": "Must contain at least one special character (!@#%^&*(),.?\":{}|<>+-)",
    "email_not_null": "Email cannot be empty!",
    "invalid_email": "Invalid email address!",
    "password_not_null": "Password cannot be empty!",
    "password_min_character": "Password must contain at least 6 characters!",
    "passwords_same": "Passwords must match!",
    "surname_is_not_empty": "Surname cannot be empty!",
    "name_is_not_empty": "Name cannot be empty!",
    "name_only_string": "Name must contain only letters!",
    "sur_name_only_string": "Surname must contain only letters!"
  },
  "messages": {
    "creating_account": "Creating account ...",
    "signing": "Signing in ...",
    "sign_outing": "Signing out ...",
    "email_already_in_use": "This email address is already in use. Try a different one.",
    "user_not_found": "This email address is not registered. Try a different one.",
    "wrong_password": "Incorrect password",
    "wrong_email_or_password": "Incorrect email or password"
  },
  "auth": {
    "signup": "Sign Up",
    "signin": "Sign In",
    "create_account": "Create Account",
    "forgot_password": "Forgot Password",
    "fill_your_info": "Fill out your information to register or try other methods",
    "welcome_back": "Welcome back! You can continue where you left off by signing in",
    "forgot_password_send_connection_link": "We need your registered email address to send the password reset link",
    "or_with": "Or with",
    "already_have_an_account": "Already have an account?",
    "dont_have_an_account": "Don't have an account?"
  },
  "user_info": {
    "complete_your_profile": "Complete Your Profile",
    "enter_your_personal_info": "Enter your personal information to complete the registration process",
    "apply_and_continue": "Apply and Continue",
    "tell_us_about_yourself": "Tell us about yourself!",
    "share_your_gender": "Share your gender with us to improve your experience",
    "how_old_are_you": "How old are you?",
    "share_your_age": "Please share your age with us"
  }
};
static const Map<String,dynamic> tr = {
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
  "validator": {
    "upper_case_validator": "En az bir büyük harf içermelidir(A-Z)",
    "digit_validator": "En az bir rakam harf içermelidir(0-9)",
    "special_char_validator": "En az bir özel karakter içermelidir(!@#%^&*(),.?\":{}|<>+-)",
    "email_not_null": "E-posta boş olamaz!",
    "invalid_email": "Geçersiz e-posta adresi!",
    "password_not_null": "Şifre boş olamaz!",
    "password_min_character": "Şifre en az 6 karakter içermelidir!",
    "passwords_same": "Şifreler aynı olmalıdır!",
    "surname_is_not_empty": "Ad boş olamaz!",
    "name_is_not_empty": "Soyad boş olamaz!",
    "name_only_string": "Ad sadece harf içermelidir!",
    "sur_name_only_string": "Ad sadece harf içermelidir!"
  },
  "messages": {
    "creating_account": "Hesap oluşturuluyor ...",
    "signing": "Giriş yapılıyor ...",
    "sign_outing": "Hesap oluşturuluyor ...",
    "email_already_in_use": "Bu e-posta adresi zaten kullanımda. Farklı bir tane deneyin.",
    "user_not_found": "Bu e-posta adresi kayıtlı değil. Farklı bir tane deneyin.",
    "wrong_password": "Hatalı şifre",
    "wrong_email_or_password": "Hatalı e-posta veya şifre"
  },
  "auth": {
    "signup": "Kayıt Ol",
    "signin": "Giriş Yap",
    "create_account": "Hesap Oluştur",
    "forgot_password": "Şifremi Unuttum",
    "fill_your_info": "Kayıt olmak için bilgilerinizi doldurun veya diğer yöntemleri deneyin",
    "welcome_back": "Tekrar hoşgeldiniz, giriş yaparak kaldığınız yerden devam edebilirsiniz",
    "forgot_password_send_connection_link": "Şifre sıfırlama bağlantısını gönderebilmemiz için hesabınıza kayıtlı e-posta adresinize ihtiyacımız var",
    "or_with": "Veya",
    "already_have_an_account": "Zaten bir hesabınız var mı?",
    "dont_have_an_account": "Hesabınız yok mu?"
  },
  "user_info": {
    "complete_your_profile": "Profilini Tamamla",
    "enter_your_personal_info": "Kayıt işlemini tamamlamak için kişisel bilgileriniz giriniz",
    "apply_and_continue": "Onayla ve Devam et",
    "tell_us_about_yourself": "Bize kendinden bahset!",
    "share_your_gender": "Deneyiminizi geliştirmek için cinsiyetinizi bizimle paylaşın",
    "how_old_are_you": "Kaç yaşındasınız?",
    "share_your_age": "Lütfen yaşınızı bizimle paylaşın"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
