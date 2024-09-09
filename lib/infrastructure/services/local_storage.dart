import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/data/address_data.dart';
import 'app_constants.dart';
import '../models/models.dart';

class LocalStorage {
  static SharedPreferences? _preferences;

  LocalStorage._();


  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> setToken(String? token) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyToken, token ?? '');
    }
  }
  static Future<void> setProfileImage(String? image) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyUserImage, image ?? '');
    }
  }
  static Future<void> setAddressSelected(AddressData data) async {
    if (_preferences != null) {
      await _preferences!.setString(
          AppConstants.keyAddressSelected, jsonEncode(data.toJson()));
    }
  }

  static AddressData? getAddressSelected() {
    String dataString =
        _preferences?.getString(AppConstants.keyAddressSelected) ?? "";
    if (dataString.isNotEmpty) {
      AddressData data = AddressData.fromJson(jsonDecode(dataString));
      return data;
    } else {
      return null;
    }
  }
  static Future<void> setUserId(int? image) async {
    if (_preferences != null) {
      await _preferences!.setInt(AppConstants.keyUserId, image ?? 0);
    }
  }
  static Future<void> setWalletData(Wallet? wallet) async {
    if (_preferences != null) {
      final String walletString = jsonEncode(wallet?.toJson());
      await _preferences!.setString(AppConstants.keyWalletData, walletString);
    }
  }
  static Future<void> setFirstName(String? image) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyFirstName, image ?? "");
    }
  }
  static Future<void> setLastName(String? image) async {
    if (_preferences != null) {
      await _preferences!.setString(AppConstants.keyLastName, image ?? "");
    }
  }
  static String getToken() => _preferences?.getString(AppConstants.keyToken) ?? '';

  static void _deleteToken() => _preferences?.remove(AppConstants.keyToken);

  static Future<void> setLanguageSelected(bool selected) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangSelected, selected);
    }
  }

  static bool getLanguageSelected() =>
      _preferences?.getBool(AppConstants.keyLangSelected) ?? false;

  static Future<void> setSettingsList(List<SettingsData> settings) async {
    if (_preferences != null) {
      final List<String> strings =
          settings.map((setting) => jsonEncode(setting.toJson())).toList();
      await _preferences!
          .setStringList(AppConstants.keyGlobalSettings, strings);
    }
  }

  static List<SettingsData> getSettingsList() {
    final List<String> settings =
        _preferences?.getStringList(AppConstants.keyGlobalSettings) ?? [];
    final List<SettingsData> settingsList = settings
        .map(
          (setting) => SettingsData.fromJson(jsonDecode(setting)),
        )
        .toList();
    return settingsList;
  }

  static Future<void> setTranslations(Map<String, dynamic>? translations) async {
    if (_preferences != null) {
      final String encoded = jsonEncode(translations);
      await _preferences!.setString(AppConstants.keyTranslations, encoded);
    }
  }

  static Map<String, dynamic> getTranslations() {
    final String encoded =
        _preferences?.getString(AppConstants.keyTranslations) ?? '';
    if (encoded.isEmpty) {
      return {};
    }
    final Map<String, dynamic> decoded = jsonDecode(encoded);
    return decoded;
  }

  static Future<void> setAppThemeMode(bool isDarkMode) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyAppThemeMode, isDarkMode);
    }
  }

  static bool getAppThemeMode() =>
      _preferences?.getBool(AppConstants.keyAppThemeMode) ?? false;

  static Future<void> setLanguageData(LanguageData? langData) async {
    if (_preferences != null) {
      final String lang = jsonEncode(langData?.toJson());
      await _preferences!.setString(AppConstants.keyLanguageData, lang);
    }
  }

  static LanguageData? getLanguage() {
    final lang = _preferences?.getString(AppConstants.keyLanguageData);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static Future<void> setLangLtr(bool? backward) async {
    if (_preferences != null) {
      await _preferences!.setBool(AppConstants.keyLangLtr, backward ?? false);
    }
  }

  static bool getLangLtr() => !(_preferences?.getBool(AppConstants.keyLangLtr) ?? false);

  static Future<void> setSelectedCurrency(CurrencyData? currency) async {
    if (_preferences != null) {
      final String currencyString = jsonEncode(currency?.toJson());
      await _preferences!
          .setString(AppConstants.keySelectedCurrency, currencyString);
    }
  }

  static CurrencyData? getSelectedCurrency() {
    final savedString =
        _preferences?.getString(AppConstants.keySelectedCurrency);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return CurrencyData.fromJson(map);
  }

  static Future<void> setUser(UserData? user) async {
    if (_preferences != null) {
      final String userString = user != null ? jsonEncode(user.toJson()) : '';
      await _preferences!.setString(AppConstants.keyUser, userString);
    }
  }

  static UserData? getUser() {
    final savedString = _preferences?.getString(AppConstants.keyUser);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return UserData.fromJson(map);
  }

  static void _deleteUser() => _preferences?.remove(AppConstants.keyUser);

  static Future<void> setWallet(Wallet? wallet) async {
    if (_preferences != null) {
      final String walletString =
          wallet != null ? jsonEncode(wallet.toJson()) : '';
      await _preferences!.setString(AppConstants.keyWallet, walletString);
    }
  }

  static Wallet? getWallet() {
    final savedString = _preferences?.getString(AppConstants.keyWallet);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return Wallet.fromJson(map);
  }

  static void _deleteWallet() => _preferences?.remove(AppConstants.keyWallet);

  static Future<void> setShop(ShopData? shop) async {
    if (_preferences != null) {
      final String shopString = shop != null ? jsonEncode(shop.toJson()) : '';
      await _preferences!.setString(AppConstants.keyShop, shopString);
    }
  }

  static ShopData? getShop() {
    final savedString = _preferences?.getString(AppConstants.keyShop);
    if (savedString == null) {
      return null;
    }
    final map = jsonDecode(savedString);
    if (map == null) {
      return null;
    }
    return ShopData.fromJson(map);
  }

  static void _deleteShop() => _preferences?.remove(AppConstants.keyShop);

  static Future<void> setSystemLanguage(LanguageData? lang) async {
    if (_preferences != null) {
      final String langString = jsonEncode(lang?.toJson());
      await _preferences!.setString(AppConstants.keySystemLanguage, langString);
    }
  }

  static LanguageData? getSystemLanguage() {
    final lang = _preferences?.getString(AppConstants.keySystemLanguage);
    if (lang == null) {
      return null;
    }
    final map = jsonDecode(lang);
    if (map == null) {
      return null;
    }
    return LanguageData.fromJson(map);
  }

  static void logout() {
    _deleteToken();
    _deleteUser();
    _deleteWallet();
    _deleteShop();
  }
}
