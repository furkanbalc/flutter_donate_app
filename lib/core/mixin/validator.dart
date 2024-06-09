import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

mixin Validator {
  /// EMAIL VALIDATOR
  String? emailValidator(String? email) {
    if (email == null || email.isEmpty) {
      return LocaleKeys.validator_email_not_null.tr();
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(email)) {
      return LocaleKeys.validator_invalid_email.tr();
    }
    return null;
  }

  /// PASSWORD VALIDATOR
  String? passwordValidator({required String? pass, required String? confirmPass}) {
    if (pass == null || pass.isEmpty) {
      return LocaleKeys.validator_password_not_null.tr();
    }
    if (pass.length < 6) {
      return LocaleKeys.validator_password_min_character.tr();
    }

    bool containsUppercase = RegExp(r'[A-Z]').hasMatch(pass);
    bool containsSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>+-]').hasMatch(pass);
    bool containsDigit = RegExp(r'\d').hasMatch(pass);

    if (!containsUppercase && !containsSpecialChar && !containsDigit) {
      return '${LocaleKeys.validator_upper_case_validator.tr()}\n${LocaleKeys.validator_special_char_validator.tr()}\n${LocaleKeys.validator_digit_validator.tr()}\n';
    } else if (!containsUppercase && !containsSpecialChar) {
      return '${LocaleKeys.validator_upper_case_validator.tr()}\n${LocaleKeys.validator_special_char_validator.tr()}\n';
    } else if (!containsUppercase && !containsDigit) {
      return '${LocaleKeys.validator_upper_case_validator.tr()}\n${LocaleKeys.validator_special_char_validator.tr()}\n';
    } else if (!containsSpecialChar && !containsDigit) {
      return '${LocaleKeys.validator_special_char_validator.tr()}\n${LocaleKeys.validator_digit_validator.tr()}\n';
    } else if (!containsUppercase) {
      return LocaleKeys.validator_upper_case_validator.tr();
    } else if (!containsSpecialChar) {
      return LocaleKeys.validator_special_char_validator.tr();
    } else if (!containsDigit) {
      return LocaleKeys.validator_digit_validator.tr();
    }
    return null;
  }

  /// VERIFY PASSWORD VALIDATOR
  String? confirmPasswordValidator({required String? pass, required String? confirmPass}) {
    if (pass == null || pass.isEmpty) {
      return LocaleKeys.validator_password_not_null.tr();
    }
    if (pass != confirmPass) {
      return LocaleKeys.validator_passwords_same.tr();
    }
    return null;
  }

  /// LOGIN PASSWORD VALIDATOR
  String? loginPasswordValidator(String? pass) {
    if (pass == null || pass.isEmpty) {
      return LocaleKeys.validator_password_not_null.tr();
    }
    if (pass.length < 6) {
      return LocaleKeys.validator_password_min_character.tr();
    }
    return null;
  }

  /// USER INFO NAME VALIDATOR
  String? nameValidator(String? name) {
    if (name == null || name.isEmpty) {
      return LocaleKeys.validator_name_is_not_empty.tr();
    }
    if(name.length <= 3) {
      return 'En az 3 karakter içermelidir';
    }
    final RegExp regex = RegExp(r'^[a-zA-ZğĞüÜşŞıİöÖçÇ]+$');
    if (!regex.hasMatch(name.trim())) {
      return LocaleKeys.validator_name_only_string.tr();
    }
    return null;
  }

  /// USER INFO SURNAME VALIDATOR
  String? surnameValidator(String? surname) {
    if (surname == null || surname.isEmpty) {
      return LocaleKeys.validator_surname_is_not_empty.tr();
    }
    if(surname.length <= 3) {
      return 'En az 3 karakter içermelidir';
    }
    final RegExp regex = RegExp(r'^[a-zA-ZğĞüÜşŞıİöÖçÇ]+$');
    if (!regex.hasMatch(surname.trim())) {
      return LocaleKeys.validator_sur_name_only_string.tr();
    }
    return null;
  }

  /// GENDER VALIDATOR
  // String? genderValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return genderIsRequired;
  //   }
  //   return null;
  // }

  /// PHONE NUMBER VALIDATOR
  String? phoneNumberValidator(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Telefon numarası boş olamaz!';
    }
    if (phoneNumber.length < 10) {
      return 'Telefon numarası çok kısa!';
    }
    if (!RegExp(r'^[0-9\s]+$').hasMatch(phoneNumber)) {
      return 'Geçersiz telefon numarası!';
    }
    if (phoneNumber.length > 10) {
      return 'Telefon numarası çok uzun!\nBaşında "0" olmadan giriniz';
    }
    return null;
  }

  /// PROVINCE VALIDATOR
  String? provinceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Bu alan boş geçilemez!';
    }
    return null;
  }
}
