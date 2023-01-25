import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void registerServices() {
  getIt.registerSingleton<NavigationService>(BeamerNavigationService());

  // getIt.registerLazySingleton<ContactRepository>(() =>   ContactRepositoryImpl(
  //   contactApi: ContactApi(DioBuilder.getInstance(ignoredToken: true,options:  BaseOptions(baseUrl: ''
  //   ))),
  //   exceptionMapper: ExceptionMapper(),
  // ),);
}
