import 'package:beamer/beamer.dart';
import 'package:black_bull_markets/application/create_wallet/create_wallet_bloc/create_wallet_bloc.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_bloc/my_wallet_bloc.dart';
import 'package:black_bull_markets/application/my_wallet/my_wallet_cubit/carousel_cubit.dart';
import 'package:black_bull_markets/domain/my_wallet/response/my_wallet_response.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/presentation/my_wallet/my_wallet_page.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/carousel_wallet_cards_with_number.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_page_loading.dart';
import 'package:black_bull_markets/shared/screen_util/screen_util_setup.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../app/common.dart';
import '../../infrastructure/create_wallet/createwallet_repository.dart';
import '../../infrastructure/my_wallet/mock_mywallet_repository.dart';

class MyWalletBlocMock extends MockBloc<MyWalletEvent, MyWalletState>
    implements MyWalletBloc {}

extension on WidgetTester {
  Future<void> buildPage(
      MyWalletBloc walletBloc, CreateWalletBloc createWalletBloc) {
    return pumpWidget(
      MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider<MyWalletBloc>(
              create: (BuildContext context) => walletBloc,
            ),
            BlocProvider<CreateWalletBloc>(
              create: (BuildContext context) => createWalletBloc,
            ),
            BlocProvider<CarouselCubit>(
              create: (BuildContext context) => CarouselCubit(),
            ),
          ],
          child: const ScreenUtilSetup(child: MyWalletPage()),
        ),
      ),
    );
  }
}

void main() async {
  late MyWalletBloc walletBloc;
  late CreateWalletBloc createWalletBloc;

  setUp(() {
    walletBloc = MyWalletBloc(myWalletRepository: MyWalletRepositoryMock());
    createWalletBloc =
        CreateWalletBloc(createWalletRepository: CreateWalletRepositoryMock());
  });

  testWidgets('Should Show MyWalletPage ', (WidgetTester widgetTester) async {
    await initWidgetTest(widgetTester: widgetTester);
    await widgetTester.buildPage(walletBloc, createWalletBloc);
    expect(find.byType(MyWalletPage), findsOneWidget);
  });

  testWidgets('MyWalletPage Page Have MyWalletAppBar Widget',
      (WidgetTester widgetTester) async {
    await initWidgetTest(widgetTester: widgetTester);
    await widgetTester.buildPage(walletBloc, createWalletBloc);
    expect(find.byType(MyWalletAppBar), findsOneWidget);
  });

  testWidgets('App bar Title matched', (WidgetTester widgetTester) async {
    await initWidgetTest(widgetTester: widgetTester);
    await widgetTester.buildPage(walletBloc, createWalletBloc);
    expect(find.text('my_wallet.title'), findsOneWidget);
  });

  testWidgets('globalBeamerDelegate is BeamerDelegate ',
      (WidgetTester widgetTester) async {
    await initWidgetTest(widgetTester: widgetTester);
    await widgetTester.buildPage(walletBloc, createWalletBloc);
    expect(globalBeamerDelegate, isA<BeamerDelegate>());
  });

  // testWidgets(
  //   'Beamer current locations should /wallet_dashboard ',
  //   (WidgetTester widgetTester) async {
  //     await initWidgetTest(widgetTester: widgetTester);
  //     await widgetTester.buildPage(walletBloc, createWalletBloc);
  //     expect(
  //       globalBeamerDelegate.configuration.location,
  //       equals(NavigationService.walletRouteUri),
  //     );
  //   },
  // );

  testWidgets(
      'MyWalletPage Render MyWalletPageLoading on MyWalletStateLoading state ',
      (WidgetTester widgetTester) async {
    walletBloc = MyWalletBlocMock();
    when(() => walletBloc.state).thenReturn(MyWalletStateLoading());
    await initWidgetTest(widgetTester: widgetTester);
    await widgetTester.buildPage(walletBloc, createWalletBloc);
    expect(find.byType(MyWalletPageLoading), findsOneWidget);
  });

  testWidgets(
      'MyWalletPage Render CarouselWalletCardsWithNumber on MyWalletStateLoaded state ',
      (WidgetTester widgetTester) async {
    walletBloc = MyWalletBlocMock();
    when(() => walletBloc.state).thenReturn(MyWalletStateLoaded(
        myWalletResponse: MyWalletResponse(), sliderWidgets: []));
    await initWidgetTest(widgetTester: widgetTester);
    await widgetTester.buildPage(walletBloc, createWalletBloc);
    expect(find.byType(CarouselWalletCardsWithNumber), findsOneWidget);
  });
  //
  // testWidgets(
  //     'ContactPage Render ContactErrorWidget on ContactStateError state ',
  //     (WidgetTester widgetTester) async {
  //   await initWidgetTest(widgetTester: widgetTester);
  //   await widgetTester.buildPage(walletBloc, createWalletBloc);
  //   expect(find.byType(AppButton), findsOneWidget);
  // });

  // testWidgets(
  //   'Tap on Contract Row  expect beamer location /contacts/details',
  //   (WidgetTester widgetTester) async {
  //     registerServices();
  //     walletBloc = MockContactBloc();
  //     when(() => walletBloc.state).thenReturn(
  //       ContactsStateLoaded(
  //         contactDataModels: MockContactDataClass.contactModelList,
  //       ),
  //     );
  //     await initWidgetTest(widgetTester: widgetTester);
  //     await widgetTester.buildPage(walletBloc);
  //     expect(find.byType(ContactRow), findsOneWidget);
  //     await widgetTester.tap(find.byType(ContactRow).first);
  //     expect(
  //       contactBeamerDelegate.configuration.location,
  //       equals(NavigationService.contactDetailsRouteUri),
  //     );
  //   },
  // );
}
