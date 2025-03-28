import 'dart:ui';
class AppConstants {
  static const String baseUrl = 'https://raw.githubusercontent.com';
  static const String countriesEndpoint = '/PouriaMoradi021/countries-api/refs/heads/main/countries.json';
  static const String countriesUrl = '$baseUrl$countriesEndpoint';
  static const String fetchDataError = 'خطا در دریافت اطلاعات';
  static const String networkError = 'مشکل در اتصال به سرور';
  static const String retryButtonText = '🔄 تلاش مجدد';
  static const String countryListTitle = 'لیست کشورها';
  static const String capitalPrefix = 'پایتخت: ';
  static const String codeSuffix = ' :کد';
  static const String fontFamilyIranSans = 'IRANSans';
  static const String splashWelcomeText = 'Welcome To My App'; 
  static const double splashFontSize = 24.0; 
  static const FontWeight splashFontWeight = FontWeight.bold; 
  static const String homeRoute = '/home'; 
  static const Duration splashDelay = Duration(seconds: 2); 
  static const double appBarFontSize = 25.0;
  static const FontWeight appBarFontWeight = FontWeight.bold;
  static const double countryNameFontSize = 18.0;
  static const FontWeight countryNameFontWeight = FontWeight.w900;
  static const double countryDetailFontSize = 14.0;
  static const FontWeight countryDetailFontWeight = FontWeight.w500;
  static const double defaultPadding = 12.0;
  static const double verticalMargin = 8.0;
  static const double horizontalMargin = 4.0;
  static const double borderRadius = 12.0;
  static const double elevation = 4.0;
}