import 'package:beamer/beamer.dart';
import 'package:black_bull_markets/shared/constants/global.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

abstract class NavigationService {
  static const String loginRouteUri = '/login';
  static const String splashRouteUri = '/splash';
  static const String accountRouteUri = '/account';
  static const String applicationRouteUri = '/application';
  static const String changeLanguageRouteUri = '/changeLanguage';
  static const String settingRouteUri = '/settings';
  static const String walletRouteUri = '/wallet_dashboard';
  static const String myWalletRouteUri = '/my_wallet';
  static const String addFundsRouteUri = '/add_funds';
  static const String internalTransferRouteUri = '/internal_transfer';
  static const String internalTransferSuccessRouteUri =
      '/internal_transfer_success';
  static const String withdrawRouteUri = '/withdraw';
  static const String historyRouteUri = '/history';
  static const String singUpRouteUri = '/signup';
  static const String singUpSuccessUri = '/signupSuccess';
  static const String shareTradingPageUri = '/shareTrading';
  static const String inputBirthRouteUri = '/input_birth';
  static const String inputEmailRouteUri = '/input_email';
  static const String personalDetailsRouteUri = '/personal_details';
  static const String tradingPreferencesRouteUri = '/trading_preferences';
  static const String quizSuitabilityRouteUri = '/quiz_suitability';
  static const String quizRouteUri = '/quiz';
  static const String employmentRouteUri = '/employment';
  static const String documentsVerificationRouteUri = '/documents_verification';
  static const String submittedSuccessRouteURI = '/submitted_success';
  static const String partnersApplicationRouteUri = '/partners_application';
  static const String partnersApplicationOptionsRouteUri =
      '/partners_application_options';
  static const String underConstructionRouteUri = '/under_construction';
  static const String addFundsSuccessRouteUri = '/add_funds_success';

  void navigateToNamed({
    required String uri,
    required BeamerDelegate beamerDelegate,
    Object? data,
  });

  void replaceWithNamed({
    required BeamerDelegate beamerDelegate,
    required String uri,
    Object? data,
  });

  Object? getRouteArguments({required BeamerDelegate beamerDelegate});

  void showSnackbar({required String message});

  void navigateBack({required BeamerDelegate beamerDelegate});

  Future<void> launchUrl({
    required String urlString,
    required bool external,
  });

  //String? get currentRouteUriString;
}

class BeamerNavigationService extends NavigationService
    with NavigationServiceMixins {
  BeamerNavigationService();

  @override
  void navigateToNamed({
    required BeamerDelegate beamerDelegate,
    required String uri,
    Object? data,
  }) =>
      beamerDelegate.beamToNamed(
        uri,
        data: data,
      );

  @override
  void showSnackbar({required String message}) =>
      scaffoldMessengerGlobalKey.currentState
          ?.showSnackBar(SnackBar(content: Text(message)));

  @override
  void replaceWithNamed({
    required BeamerDelegate beamerDelegate,
    required String uri,
    Object? data,
  }) =>
      beamerDelegate.beamToReplacementNamed(uri, data: data);

  @override
  void navigateBack({required BeamerDelegate beamerDelegate}) =>
      beamerDelegate.beamBack();

  @override
  Object? getRouteArguments({required BeamerDelegate beamerDelegate}) =>
      beamerDelegate.currentBeamLocation.data;

  // @override
  // String? get currentRouteUriString =>
  //     globalBeamerDelegate.currentConfiguration?.location;
}

mixin NavigationServiceMixins implements NavigationService {
  @override
  Future<void> launchUrl({
    required String urlString,
    required bool external,
  }) async {
    if (await launcher.canLaunchUrl(Uri.parse(urlString))) {
      await launcher.launchUrl(
        Uri.parse(urlString),
        mode: external
            ? launcher.LaunchMode.externalApplication
            : launcher.LaunchMode.inAppWebView,
        webViewConfiguration: const launcher.WebViewConfiguration(),
      );
    }
  }
}
