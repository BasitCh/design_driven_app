import 'package:black_bull_markets/presentation/my_wallet/widgets/mywallet_appbar.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/core/application_modle.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/app_dashboard.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  late List<ApplicationModel> appName;

  @override
  void initState() {
    setApps();
    super.initState();
  }

  setApps() {
    appName = [];
    appName.add(
      ApplicationModel(
        appName: 'applications.applicationType.forexAndCfds',
        type: TYPE.forexAndCfd,
      ),
    );
    appName.add(
      ApplicationModel(
        appName: 'applications.applicationType.shareTrading',
        type: TYPE.shareTrading,
      ),
    );
    appName.add(
      ApplicationModel(
        appName: 'applications.applicationType.partners',
        type: TYPE.partners,
      ),
    );
    appName.add(
      ApplicationModel(
        appName: 'applications.applicationType.mam/pamm',
        type: TYPE.mamPamm,
      ),
    );
    appName.add(
      ApplicationModel(
        appName: 'applications.applicationType.investorAccount',
        type: TYPE.investorAccount,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.lightGreyBg,
      bullPath: BlackBullImages.bullGrey,
      appBar: Builder(
        builder: (context) {
          return MyWalletAppBar(
            onDrawerPressed: Scaffold.of(context).openDrawer,
            onNotificationPressed: () {},
            title: 'Applications',
          );
        },
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 38, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            50.verticalGap,
            StandardText.headline1(
              context,
              'applications.mainHeading'.tr(),
              color: BlackBullColors.black,
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
            9.verticalGap,
            StandardText.headline1(
              context,
              'applications.subHeading'.tr(),
              color: BlackBullColors.black,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
            45.verticalGap,
            // ApplicationInfoBox(
            //   borderRadius: 10.0,
            //   backColor: BlackBullColors.white10,
            //   iconPath: BlackBullIcons.icFactCheck,
            //   mainHeading: StandardText.headline1(context, 'applications.success'.tr().toUpperCase(),
            //   fontWeight: FontWeight.w800,
            //     fontSize: 20,
            //     color: BlackBullColors.black,
            //   ),
            //   subHeading: StandardText.headline1(context, 'applications.successMessage'.tr(),
            //     fontWeight: FontWeight.w600,
            //     fontSize: 16,
            //     color: BlackBullColors.black,
            //   ),
            // )
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 3 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: appName.length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      // for navigation purpose base on application type e.g if(appName[index].type==TYPE.forexAndCfd)
                      if (kDebugMode) {
                        if (appName[index].type == TYPE.forexAndCfd) {
                          print('Application Type:${appName[index].type}');
                        }
                      }
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: AppDashboard(
                        appName: appName[index].appName.tr(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
