import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'sw'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? swText = '',
  }) =>
      [enText, swText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // splash
  {
    'tdvgejkx': {
      'en': 'V 1.0.0',
      'sw': 'V 1.0.0',
    },
    'za86zjol': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // login
  {
    'aeq7ywsj': {
      'en': 'Sign In',
      'sw': 'Weka sahihi',
    },
    'cixxn467': {
      'en': 'Email or Username',
      'sw': 'Barua pepe au Jina la mtumiaji',
    },
    'qn5zdwsd': {
      'en': 'Password',
      'sw': 'Nenosiri',
    },
    'uo9smbvb': {
      'en': 'Sign In',
      'sw': 'Weka sahihi',
    },
    '49izen31': {
      'en': 'Or ',
      'sw': 'Au',
    },
    'epa8m5na': {
      'en': 'Sign In ',
      'sw': 'Weka sahihi',
    },
    '8uhgcv5q': {
      'en': 'With',
      'sw': 'Na',
    },
    'jcrw0664': {
      'en': 'Do not have an account? ',
      'sw': 'Je, huna akaunti?',
    },
    'pdwrbpd5': {
      'en': 'Sign Up',
      'sw': 'Jisajili',
    },
    '8ghhlil7': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // signup
  {
    'eypgdyft': {
      'en': 'Create an Account',
      'sw': 'Fungua akaunti',
    },
    'awj2mirs': {
      'en': 'Already have an account? ',
      'sw': 'Je, tayari una akaunti?',
    },
    '9phh61h9': {
      'en': 'Sign In',
      'sw': 'Weka sahihi',
    },
    'lfk9erhj': {
      'en': 'First Name',
      'sw': 'Jina la kwanza',
    },
    '3n81jome': {
      'en': 'Last Name',
      'sw': 'Jina la familia',
    },
    '27jv28es': {
      'en': 'Email address',
      'sw': 'Barua pepe',
    },
    'sf1rtyuw': {
      'en': 'Password',
      'sw': 'Nenosiri',
    },
    '2gqdhnxk': {
      'en': 'Confirm Password',
      'sw': 'Thibitisha Nenosiri',
    },
    '52crqc82': {
      'en': 'Phone Number',
      'sw': 'Nambari ya simu',
    },
    'dxwjyuaw': {
      'en': 'Address',
      'sw': 'Anwani',
    },
    'acma1im5': {
      'en': 'By clicking ',
      'sw': 'Kwa kubofya',
    },
    'uslxhlo4': {
      'en': 'Continue, ',
      'sw': 'Endelea,',
    },
    'lbi91oho': {
      'en': 'You\'ll be agreeing to our ',
      'sw': 'Utakuwa unakubali yetu',
    },
    '95bs2f4c': {
      'en': 'Terms ',
      'sw': 'Masharti',
    },
    'ws7dpphs': {
      'en': 'and ',
      'sw': 'na',
    },
    '4plwuv6e': {
      'en': 'Conditions',
      'sw': 'Masharti',
    },
    '5qqveg43': {
      'en': 'Continue',
      'sw': 'Endelea',
    },
    'dtvmi09h': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // loginWithPhone
  {
    'u8fg1oy1': {
      'en': 'Sign In',
      'sw': 'Weka sahihi',
    },
    'x5yznqfh': {
      'en': 'Phone Number',
      'sw': 'Nambari ya simu',
    },
    'hlmtokea': {
      'en': 'Continue',
      'sw': 'Endelea',
    },
    '0gl8rizp': {
      'en': 'Or ',
      'sw': 'Au',
    },
    'jiexba35': {
      'en': 'Sign In ',
      'sw': 'Weka sahihi',
    },
    'ohjz2qa1': {
      'en': 'With',
      'sw': 'Na',
    },
    'hrhlaejo': {
      'en': 'Do not have an account? ',
      'sw': 'Je, huna akaunti?',
    },
    'jqp9q9ly': {
      'en': 'Sign Up',
      'sw': 'Jisajili',
    },
    '29ok8jus': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // loginWithPhoneVerification
  {
    '21m65n9n': {
      'en': 'Sign In',
      'sw': 'Weka sahihi',
    },
    'm0g09xnl': {
      'en': 'Enter verification code',
      'sw': 'Weka nambari ya kuthibitisha',
    },
    'btshf8af': {
      'en': 'Continue',
      'sw': 'Endelea',
    },
    'rjkooxoj': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // homePage
  {
    '1xnnswpk': {
      'en': 'Home',
      'sw': 'Nyumbani',
    },
  },
  // Miscellaneous
  {
    'wcgyfkto': {
      'en':
          'We need access to your camera to capture photos for product verification and user profile pictures.',
      'sw':
          'Tunahitaji ufikiaji wa kamera yako ili kupiga picha kwa uthibitishaji wa bidhaa na picha za wasifu wa mtumiaji.',
    },
    '3dkixwmh': {
      'en':
          'We need your permission to send notifications. Receive alerts about discounts, order deliveries, and expert farming advice!',
      'sw':
          'Tunahitaji ruhusa yako ili kutuma arifa. Pokea arifa kuhusu punguzo, utoaji wa maagizo, na ushauri wa kitaalamu wa kilimo!',
    },
    'eorna123': {
      'en':
          'We need access to your photo library to upload images for products and profile pictures.',
      'sw':
          'Tunahitaji ufikiaji wa maktaba yako ya picha ili kupakia picha za bidhaa na picha za wasifu.',
    },
    'btquebqe': {
      'en':
          'We need your location to provide accurate delivery services and personalized recommendations.',
      'sw':
          'Tunahitaji eneo lako ili kutoa huduma sahihi za uwasilishaji na mapendekezo yanayokufaa.',
    },
    '4k8rrmm8': {
      'en': '',
      'sw': '',
    },
    'vpfme7ip': {
      'en': '',
      'sw': '',
    },
    'jdg5uads': {
      'en': '',
      'sw': '',
    },
    'hv6njzba': {
      'en': '',
      'sw': '',
    },
    'fjsys4lh': {
      'en': '',
      'sw': '',
    },
    'nwl95q9e': {
      'en': '',
      'sw': '',
    },
    'nnmfd1d3': {
      'en': '',
      'sw': '',
    },
    'gapo129j': {
      'en': '',
      'sw': '',
    },
    'rwilwn9q': {
      'en': '',
      'sw': '',
    },
    'jo88t2gf': {
      'en': '',
      'sw': '',
    },
    '1q7oqp9q': {
      'en': '',
      'sw': '',
    },
    'mhoi28wp': {
      'en': '',
      'sw': '',
    },
    's2fr4y5c': {
      'en': '',
      'sw': '',
    },
    'r13bofzm': {
      'en': '',
      'sw': '',
    },
    'm5k2v4lm': {
      'en': '',
      'sw': '',
    },
    'zlelc4qe': {
      'en': '',
      'sw': '',
    },
    'f0y415hj': {
      'en': '',
      'sw': '',
    },
    '2en4my7s': {
      'en': '',
      'sw': '',
    },
    'wni0ibs9': {
      'en': '',
      'sw': '',
    },
    '315lsznm': {
      'en': '',
      'sw': '',
    },
    '614gerw1': {
      'en': '',
      'sw': '',
    },
    '93g0mgco': {
      'en': '',
      'sw': '',
    },
    'wrp1gw2t': {
      'en': '',
      'sw': '',
    },
  },
].reduce((a, b) => a..addAll(b));
