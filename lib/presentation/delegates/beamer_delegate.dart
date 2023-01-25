import 'package:beamer/beamer.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/accounts/account_page.dart';
import 'package:black_bull_markets/presentation/accounts/change_language.dart';
import 'package:black_bull_markets/presentation/add_funds/add_funds_page.dart';
import 'package:black_bull_markets/presentation/add_funds/add_funds_success_page.dart';
import 'package:black_bull_markets/presentation/applications/application_page.dart';
import 'package:black_bull_markets/presentation/internal_transfer/internal_transfer_page.dart';
import 'package:black_bull_markets/presentation/internal_transfer/transfer_fund_success_page.dart';
import 'package:black_bull_markets/presentation/login/login_page.dart';
import 'package:black_bull_markets/presentation/my_wallet/my_wallet_page.dart';
import 'package:black_bull_markets/presentation/onboarding/documents_verification_page.dart';
import 'package:black_bull_markets/presentation/onboarding/employment_page.dart';
import 'package:black_bull_markets/presentation/onboarding/personal_details_page.dart';
import 'package:black_bull_markets/presentation/onboarding/quiz_page.dart';
import 'package:black_bull_markets/presentation/onboarding/quiz_suitability_page.dart';
import 'package:black_bull_markets/presentation/onboarding/share_trading_page.dart';
import 'package:black_bull_markets/presentation/onboarding/trading_preferences_page.dart';
import 'package:black_bull_markets/presentation/partners/partners_application_options_page.dart';
import 'package:black_bull_markets/presentation/partners/partners_application_page.dart';
import 'package:black_bull_markets/presentation/signup/input_birth_page.dart';
import 'package:black_bull_markets/presentation/signup/input_email_page.dart';
import 'package:black_bull_markets/presentation/signup/signup_page.dart';
import 'package:black_bull_markets/presentation/signup/signup_success_page.dart';
import 'package:black_bull_markets/presentation/splash/splash.dart';
import 'package:black_bull_markets/presentation/under_construction.dart';
import 'package:black_bull_markets/presentation/wallet/wallet_dashboard.dart';
import 'package:black_bull_markets/shared/constants/beamer_keys.dart';
import 'package:black_bull_markets/shared/widgets/submitted_page.dart';
import 'package:flutter/material.dart';

BeamerParser createBeamerParser() => BeamerParser();
BeamerDelegate globalBeamerDelegate = createBeamerDelegate();

BeamerDelegate createBeamerDelegate() => BeamerDelegate(
      initialPath: NavigationService.addFundsRouteUri,
      locationBuilder: RoutesLocationBuilder(
        routes: {
          NavigationService.splashRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('splash'),
                title: 'Splash',
                child: Splash(),
              ),
          NavigationService.loginRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('login'),
                title: 'Login',
                child: LoginPage(),
              ),
          NavigationService.accountRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('accounts'),
                title: 'Accounts',
                child: AccountPage(),
              ),
          NavigationService.applicationRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('applications'),
                title: 'Applications',
                child: ApplicationPage(),
              ),
          NavigationService.changeLanguageRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('changeLanguage'),
                title: 'Change Language',
                child: ChangeLanguagePage(),
              ),
          NavigationService.walletRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('wallet'),
                title: 'Wallet Dashboard',
                child: WalletDashboard(),
              ),
          NavigationService.singUpRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('singup'),
                title: 'Sign up',
                child: SignUpPage(),
              ),
          NavigationService.singUpSuccessUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('singUpSuccess'),
                title: 'Sign up success',
                child: SignUpSuccessPage(),
              ),
          NavigationService.inputEmailRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('input_email'),
                title: 'Input Email',
                child: InputEmailPage(),
              ),
          NavigationService.inputBirthRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('input_birth'),
                title: 'Input Birth',
                child: InputBirthPage(),
              ),
          NavigationService.myWalletRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey(MY_WALLET_BEAMER_KEY),
                title: 'My Wallet',
                child: MyWalletPage(),
              ),
          NavigationService.personalDetailsRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('personal_details'),
                title: 'Personal Details',
                child: PersonalDetailsPage(),
              ),
          NavigationService.tradingPreferencesRouteUri:
              (context, state, data) => const BeamPage(
                    key: ValueKey('trading_preferences'),
                    title: 'Trading Preferences',
                    child: TradingPreferencesPage(),
                  ),
          NavigationService.quizSuitabilityRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('quiz_suitability'),
                title: 'Quiz Suitability',
                child: QuizSuitabilityPage(),
              ),
          NavigationService.quizRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('quiz'),
                title: 'Quiz',
                child: QuizPage(),
              ),
          NavigationService.employmentRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('employment'),
                title: 'Employment',
                child: EmploymentPage(),
              ),
          NavigationService.documentsVerificationRouteUri:
              (context, state, data) => const BeamPage(
                    key: ValueKey('documents_verification'),
                    title: 'Document Verification',
                    child: DocumentsVerificationPage(),
                  ),
          NavigationService.internalTransferRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('internal_transfer'),
                title: 'Internal transfer',
                child: InternalTransferPage(),
              ),
          NavigationService.internalTransferSuccessRouteUri:
              (context, state, data) => const BeamPage(
                    key: ValueKey('transfer_success'),
                    title: 'Internal transfer Success',
                    child: TransferFundSuccessPage(),
                  ),
          NavigationService.submittedSuccessRouteURI: (context, state, data) =>
              BeamPage(
                key: const ValueKey('submitted_success_page'),
                title: 'Success',
                child: SubmittedPage(data as SubmittedPageArgs),
              ),
          NavigationService.shareTradingPageUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('shareTradingPage'),
                title: 'Share Trading',
                child: ShareTradingPage(),
              ),
          NavigationService.partnersApplicationRouteUri:
              (context, state, data) => const BeamPage(
                    key: ValueKey('partnersApplicationPage'),
                    title: 'Partners Application',
                    child: PartnersApplicationPage(),
                  ),
          NavigationService.partnersApplicationOptionsRouteUri:
              (context, state, data) => const BeamPage(
                    key: ValueKey('partnersApplicationOptionsPage'),
                    title: 'Partners Application Options',
                    child: PartnersApplicationOptionsPage(),
                  ),
          NavigationService.underConstructionRouteUri: (context, state, data) =>
              BeamPage(
                key: const ValueKey('under'),
                title: 'Under construction',
                child: UnderConstruction(
                  title: data as String,
                ),
              ),
          NavigationService.addFundsRouteUri: (context, state, data) =>
              const BeamPage(
                key: ValueKey('addFunds'),
                title: 'Add Funds',
                child: AddFundsPage(),
              ),
          NavigationService.addFundsSuccessRouteUri: (context, state, data) =>
          const BeamPage(
            key: ValueKey('addFundsSuccess'),
            title: 'Add Funds Success',
            child: AddFundsSuccessPage(),
          ),
        },
      ),
    );
