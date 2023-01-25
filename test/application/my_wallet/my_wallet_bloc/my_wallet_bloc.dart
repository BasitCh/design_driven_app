import 'package:black_bull_markets/application/my_wallet/my_wallet_bloc/my_wallet_bloc.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../infrastructure/my_wallet/mock_mywallet_repository.dart';

void main() {
  blocTest<MyWalletBloc, MyWalletState>(
    'emit [MyWalletStateLoaded] on FetchMyWalletItems ',
    build: () {
      return MyWalletBloc(myWalletRepository: MyWalletRepositoryMock());
    },
    act: (MyWalletBloc bloc) => bloc.add(FetchMyWalletItems()),
    expect: () => [
      MyWalletStateLoading(),
      MyWalletStateLoaded(
          myWalletResponse: MyWalletRemoteDataSource.getWalletResponse(),
          sliderWidgets: []),
    ],
  );
}
