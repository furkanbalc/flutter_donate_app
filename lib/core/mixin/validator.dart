import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_donate_app/translations/locale_keys.g.dart';

mixin Validator {
  /// EMAIL VALIDATOR
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_email_not_null.tr();
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return LocaleKeys.validator_invalid_email.tr();
    }
    return null;
  }

  /// PASSWORD VALIDATOR
  String? passwordValidator({required String? value, required String? confirmPass}) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_password_not_null.tr();
    }
    if (value.length < 6) {
      return LocaleKeys.validator_password_min_character.tr();
    }

    bool containsUppercase = RegExp(r'[A-Z]').hasMatch(value);
    bool containsSpecialChar = RegExp(r'[!@#$%^&*(),.?":{}|<>+-]').hasMatch(value);
    bool containsDigit = RegExp(r'\d').hasMatch(value);

    if (!containsUppercase && !containsSpecialChar && !containsDigit) {
      return '${LocaleKeys.validator_upper_case_validator.tr()}\n + ${LocaleKeys.validator_special_char_validator.tr()}\n + ${LocaleKeys.validator_digit_validator.tr()}\n';
    } else if (!containsUppercase && !containsSpecialChar) {
      return '${LocaleKeys.validator_upper_case_validator.tr()}\n + ${LocaleKeys.validator_special_char_validator.tr()}\n';
    } else if (!containsUppercase && !containsDigit) {
      return '${LocaleKeys.validator_upper_case_validator.tr()}\n + ${LocaleKeys.validator_special_char_validator.tr()}\n';
    } else if (!containsSpecialChar && !containsDigit) {
      return '${LocaleKeys.validator_special_char_validator.tr()}\n + ${LocaleKeys.validator_digit_validator.tr()}\n';
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
  String? confirmPasswordValidator({required String? value, required String? pass}) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_password_not_null.tr();
    }
    if (value != pass) {
      return LocaleKeys.validator_passwords_same.tr();
    }
    return null;
  }

  /// LOGIN PASSWORD VALIDATOR
  String? loginPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_password_not_null.tr();
    }
    if (value.length < 6) {
      return LocaleKeys.validator_password_min_character.tr();
    }
    return null;
  }

  /// USER INFO NAME VALIDATOR
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_name_is_not_empty.tr();
    }
    final RegExp regex = RegExp(r'^[a-zA-ZğĞüÜşŞıİöÖçÇ]+$');
    if (!regex.hasMatch(value)) {
      return LocaleKeys.validator_name_only_string.tr();
    }
    return null;
  }

  /// USER INFO SURNAME VALIDATOR
  String? surnameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validator_surname_is_not_empty.tr();
    }
    final RegExp regex = RegExp(r'^[a-zA-ZğĞüÜşŞıİöÖçÇ]+$');
    if (!regex.hasMatch(value)) {
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
  String? phoneNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefon numarası boş olamaz!';
    }
    if (value.length < 9) {
      return 'Telefon numarası çok kısa!';
    }
    if (!RegExp(r'^[0-9\s]+$').hasMatch(value)) {
      return 'Geçersiz telefon numarası!';
    }

    return null;
  }
}
