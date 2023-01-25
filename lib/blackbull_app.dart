// ignore_for_file: always_specify_types

import 'dart:async';
import 'dart:ui' as ui;

import 'package:beamer/beamer.dart';
import 'package:black_bull_markets/application/accounts/account_bloc/create_account_bloc.dart';
import 'package:black_bull_markets/application/accounts/account_cubit/live_demo_cubit.dart';
import 'package:black_bull_markets/application/accounts/account_cubit/search_filter_cubit.dart';
import 'package:black_bull_markets/application/accounts/my_accounts_bloc/my_account_bloc.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_bloc/add_funds_bloc.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_card_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/add_funds_number_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/amount_alert_box_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/confirmation_alert_box_cubit.dart';
import 'package:black_bull_markets/application/add_funds/add_funds_cubit/payement_card_cubit.dart';
import 'package:black_bull_markets/application/common/common_bloc.dart';
import 'package:black_bull_markets/application/create_wallet/create_wallet_bloc/create_wallet_bloc.dart';
import 'package:black_bull_markets/application/create_wallet/create_wallet_cubit/country_cubit.dart';
import 'package:black_bull_markets/application/create_wallet/create_wallet_cubit/nickname_cubit.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_bloc/internal_transfer_bloc.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_cubit/confirm_transfer_cubit.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_cubit/custom_stepper_cubit.dart';
import 'package:black_bull_markets/application/internal_transfer/internal_transfer_cubit/internal_transfer_cubit.dart';
import 'package:black_bull_markets/application/login/login_bloc/login_bloc.dart';
import 'package:black_bull_markets/application/login/login_cubit/remeber_me_cubit.dart';
import 'package:black_bull_markets/application/login/login_cubit/show_hide_password_cubit.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_bloc/my_wallet_bloc.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_cubit/carousel_cubit.dart';
import 'package:black_bull_markets/application/share_trading_cubit/share_trading_cubit.dart';
import 'package:black_bull_markets/application/singup/sign_up/signup_bloc.dart';
import 'package:black_bull_markets/application/wallet/wallet_bloc/wallet_bloc.dart';
import 'package:black_bull_markets/infrastructure/add_funds/add_funds_remote_data_source.dart';
import 'package:black_bull_markets/infrastructure/add_funds/add_funds_repository.dart';
import 'package:black_bull_markets/infrastructure/create_wallet/createwallet_remote_data_source.dart';
import 'package:black_bull_markets/infrastructure/create_wallet/createwallet_repository.dart';
import 'package:black_bull_markets/infrastructure/internal_transfer/internal_transfer_remote_data_source.dart';
import 'package:black_bull_markets/infrastructure/internal_transfer/internal_transfer_repository.dart';
import 'package:black_bull_markets/infrastructure/login/i_login_repository.dart';
import 'package:black_bull_markets/infrastructure/login/login_repository.dart';
import 'package:black_bull_markets/infrastructure/my_account/myaccount_remote_data_source.dart';
import 'package:black_bull_markets/infrastructure/my_account/myaccount_repository.dart';
import 'package:black_bull_markets/infrastructure/my_wallet/mywallet_remote_data_source.dart';
import 'package:black_bull_markets/infrastructure/my_wallet/mywallet_repository.dart';
import 'package:black_bull_markets/infrastructure/signup/signup_remote_data_source.dart';
import 'package:black_bull_markets/infrastructure/signup/signup_repository.dart';
import 'package:black_bull_markets/infrastructure/wallet/wallet_remote_data_source.dart';
import 'package:black_bull_markets/infrastructure/wallet/wallet_repository.dart';
import 'package:black_bull_markets/presentation/add_funds/widgets/add_fund_radio_amount_index.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/intenet_connection/no_connection.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/helpers/shared_preferences_helper.dart';
import 'package:black_bull_markets/shared/helpers/theme.dart';
import 'package:black_bull_markets/shared/network/network_provider.dart';
import 'package:black_bull_markets/shared/network/utils/api_constant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlackBullApp extends StatefulWidget {
  const BlackBullApp({Key? key}) : super(key: key);

  @override
  State<BlackBullApp> createState() => _BlackBullAppState();
}

class _BlackBullAppState extends State<BlackBullApp> {
  late SignUpRepository _contactRepository;
  late WalletRepository _walletRepository;
  late LoginRepository _loginRepository;
  late MyWalletRepository _myWalletRepository;
  late CreateWalletRepository _createWalletRepository;
  late MyAccountRepository _myAccountRepository;
  late Connectivity _connectivity;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final _networkNotifier = ValueNotifier(false);
  late InternalTransferRepository _internalTransferRepository;
  late AddFundsRepository _addFundsRepository;

  @override
  void dispose() {
    _networkNotifier.dispose();
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _initNetwork();
    SharedPreferenceHelper.instance.init();

    super.initState();

    initRepositories();
  }

  _initNetwork() {
    _connectivity = Connectivity();
    initConnectivity();
    listenNetworkState();
  }

  listenNetworkState() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) async {
      if (event == ConnectivityResult.none) {
        _networkNotifier.value = true;
      } else {
        ConnectivityResult result = await _connectivity.checkConnectivity();
        if (result == ConnectivityResult.none) {
          _networkNotifier.value = true;
        } else {
          _networkNotifier.value = false;
        }
      }
    });
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      await _updateConnectionStatus(ConnectivityResult.none);
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      _networkNotifier.value = true;
    } else {
      _networkNotifier.value = false;
    }
  }

  initRepositories() {
    _contactRepository = SignUpRepository(
      contactApi: SignUpRemoteDataSource(
        Dio()
        // Dio.getInstance(
        //   ignoredToken: true,
        //   options: BaseOptions(
        //     baseUrl:
        //         'https://m6m7k44uxf.execute-api.eu-central-1.amazonaws.com/v1/api',
        //   ),
        // ),
        ,
      ),
      // exceptionMapper: ExceptionMapper(),
    );
    _walletRepository = WalletRepository(
      walletRemoteDataSource: WalletRemoteDataSource(
        Dio(),
      ),
    );
    _loginRepository = LoginRepository(
      iLoginRepository: ILoginRepository(
        NetworkProvider.instance(cookie: ApiConstant.cookie),
        baseUrl: ApiConstant.baseUrl,
      ),
    );
    _myWalletRepository = MyWalletRepository(
      myWalletRemoteDataSource: MyWalletRemoteDataSource(
        Dio(),
      ),
    );
    _myAccountRepository = MyAccountRepository(
      myAccountRemoteDataSource: MyAccountRemoteDataSource(
        Dio(),
      ),
    );
    _createWalletRepository = CreateWalletRepository(
      createWalletRemoteDataSource: CreateWalletRemoteDataSource(
        Dio(),
      ),
    );
    _internalTransferRepository = InternalTransferRepository(
      internalTransferRemoteSource: InternalTransferRemoteSource(
        Dio(),
      ),
    );
    _addFundsRepository = AddFundsRepository(
      addFundsRemoteDataSource: AddFundsRemoteDataSource(
        Dio(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => _contactRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _walletRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _myWalletRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _createWalletRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _myAccountRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _internalTransferRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _loginRepository,
        ),
        RepositoryProvider(
          create: (BuildContext context) => _addFundsRepository,
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (BuildContext context) =>
                LoginBloc(loginRepository: _loginRepository),
          ),
          BlocProvider<ShowHidePasswordCubit>(
            create: (BuildContext context) => ShowHidePasswordCubit(),
          ),
          BlocProvider<RememberMeCubit>(
            create: (BuildContext context) => RememberMeCubit(),
          ),
          BlocProvider<CreateAccountBloc>(
            create: (BuildContext context) => CreateAccountBloc(),
          ),
          BlocProvider<LiveDemoCubit>(
            create: (BuildContext context) => LiveDemoCubit(),
          ),
          BlocProvider<SearchFilterCubit>(
            create: (BuildContext context) => SearchFilterCubit(),
          ),
          BlocProvider<SignupBloc>(
            create: (BuildContext context) => SignupBloc(
              contactRepository:
                  RepositoryProvider.of<SignUpRepository>(context),
            ),
          ),
          BlocProvider<WalletBloc>(
            create: (BuildContext context) => WalletBloc(
              walletRepository:
                  RepositoryProvider.of<WalletRepository>(context),
            ),
          ),
          BlocProvider<MyAccountBloc>(
            create: (BuildContext context) => MyAccountBloc(
              myAccountRepository:
                  RepositoryProvider.of<MyAccountRepository>(context),
            ),
          ),
          BlocProvider<CommonBloc>(
            create: (BuildContext context) => CommonBloc(),
          ),
          BlocProvider<MyWalletBloc>(
            create: (BuildContext context) => MyWalletBloc(
              myWalletRepository:
                  RepositoryProvider.of<MyWalletRepository>(context),
            ),
          ),
          BlocProvider<CarouselCubit>(
            create: (BuildContext context) => CarouselCubit(),
          ),
          BlocProvider<CreateWalletBloc>(
            create: (BuildContext context) => CreateWalletBloc(
              createWalletRepository:
                  RepositoryProvider.of<CreateWalletRepository>(context),
            ),
          ),
          BlocProvider<CountryCubit>(
            create: (BuildContext context) => CountryCubit(),
          ),
          BlocProvider<NicknameCubit>(
            create: (BuildContext context) => NicknameCubit(),
          ),
          BlocProvider<CustomStepperCubit>(
            create: (BuildContext context) => CustomStepperCubit(),
          ),
          BlocProvider<ConfirmTransferCubit>(
            create: (BuildContext context) => ConfirmTransferCubit(),
          ),
          BlocProvider<InternalTransferBloc>(
            create: (BuildContext context) => InternalTransferBloc(
              internalTransferRepository:
                  RepositoryProvider.of<InternalTransferRepository>(context),
            ),
          ),
          BlocProvider<InternalTransferCubit>(
            create: (BuildContext context) => InternalTransferCubit(),
          ),
          BlocProvider<ShareTradingCubit>(
            create: (BuildContext context) => ShareTradingCubit(),
          ),
          BlocProvider<AddFundsNumberCubit>(
            create: (BuildContext context) => AddFundsNumberCubit(),
          ),
          BlocProvider<AddFundsCardCubit>(
            create: (BuildContext context) => AddFundsCardCubit(),
          ),
          BlocProvider<PaymentCardCubit>(
            create: (BuildContext context) => PaymentCardCubit(),
          ),
          BlocProvider<AddFundsBloc>(
            create: (BuildContext context) => AddFundsBloc(
              addFundsRepository:
                  RepositoryProvider.of<AddFundsRepository>(context),
            ),
          ),
          BlocProvider<AmountAlertBoxCubit>(
            create: (BuildContext context) => AmountAlertBoxCubit(),
          ),
          BlocProvider<AddFundRadioAmountIndex>(
            create: (BuildContext context) => AddFundRadioAmountIndex(),
          ),
          BlocProvider<ConfirmationAlertBoxCubit>(
            create: (BuildContext context) => ConfirmationAlertBoxCubit(),
          ),
          //ConfirmationAlertBoxCubit
        ],
        child: _BlackBullApp(
          theme: BlackBullTheme.standard,
          networkNotifier: _networkNotifier,
        ),
      ),
    );
  }
}

class _BlackBullApp extends StatelessWidget {
  const _BlackBullApp({
    Key? key,
    required this.theme,
    required this.networkNotifier,
  }) : super(key: key);
  final ValueNotifier networkNotifier;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ar'),
      ],
      //fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: Builder(
        builder: (BuildContext context) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          backButtonDispatcher:
              BeamerBackButtonDispatcher(delegate: globalBeamerDelegate),
          builder: (BuildContext context, Widget? child) =>
              AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.dark.copyWith(
              systemNavigationBarColor: BlackBullColors.primary,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: Directionality(
              textDirection: ui.TextDirection.ltr,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                child: Stack(
                  children: [
                    child ?? Container(),
                    ValueListenableBuilder(
                      valueListenable: networkNotifier,
                      builder: (context, value, state) {
                        return value ? const NoConnection() : Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          routerDelegate: globalBeamerDelegate,
          routeInformationParser: createBeamerParser(),
          supportedLocales: context.supportedLocales,
          theme: theme,
        ),
      ),
    );
  }
}
