import 'package:black_bull_markets/infrastructure/di/injectable.dart';
import 'package:black_bull_markets/infrastructure/services/navigation_service.dart';
import 'package:black_bull_markets/presentation/delegates/beamer_delegate.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Global Menu drwawer key
final GlobalKey<ScaffoldState> kNavDrawerGlobalKey = GlobalKey();

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    this.backgroundColor = BlackBullColors.primary,
    this.appBar,
    this.body,
    this.bullPath = '',
  }) : super(key: key);

  final Widget? appBar;
  final Widget? body;
  final Color? backgroundColor;
  final String bullPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: appBar!,
            )
          : null,
      drawer: _drawer(context),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(
              bullPath.isEmpty ? BlackBullImages.bullGrey : bullPath,
            ),
          ),
          if (body != null) body!,
        ],
      ),
    );
  }

  Drawer _drawer(BuildContext context) {
    return Drawer(
      key: kNavDrawerGlobalKey,
      backgroundColor: BlackBullColors.lightGreyBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Builder(
              builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                },
                icon: const Icon(
                  Icons.keyboard_arrow_left_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          _menuItem(
            context: context,
            icon: BlackBullIcons.menuApplications,
            text: 'menu.applications'.tr(),
            onTap: () {
              getIt<NavigationService>().replaceWithNamed(
                uri: NavigationService.applicationRouteUri,
                data: 'Applications',
                beamerDelegate: globalBeamerDelegate,
              );
            },
          ),
          _menuItem(
            context: context,
            icon: BlackBullIcons.menuAccounts,
            text: 'menu.accounts'.tr(),
            onTap: () {
              getIt<NavigationService>().replaceWithNamed(
                uri: NavigationService.accountRouteUri,
                beamerDelegate: globalBeamerDelegate,
              );
            },
          ),
          _menuItem(
            context: context,
            icon: BlackBullIcons.menuWallet,
            text: 'menu.myWallet'.tr(),
            onTap: () {
              getIt<NavigationService>().replaceWithNamed(
                uri: NavigationService.walletRouteUri,
                beamerDelegate: globalBeamerDelegate,
              );
            },
          ),
          _menuItem(
            context: context,
            icon: BlackBullIcons.menuPartners,
            text: 'menu.partners'.tr(),
            onTap: () {
              getIt<NavigationService>().replaceWithNamed(
                uri: NavigationService.partnersApplicationRouteUri,
                data: 'Partners',
                beamerDelegate: globalBeamerDelegate,
              );
            },
          ),
          _menuItem(
            context: context,
            icon: BlackBullIcons.menuLeadFollow,
            text: 'menu.leadFollow'.tr(),
            onTap: () {
              getIt<NavigationService>().replaceWithNamed(
                uri: NavigationService.underConstructionRouteUri,
                data: 'Lead follow',
                beamerDelegate: globalBeamerDelegate,
              );
            },
          ),
          const SizedBox(height: 40.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 1.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: BlackBullColors.green,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              onPressed: () {
                getIt<NavigationService>().replaceWithNamed(
                  uri: NavigationService.walletRouteUri,
                  beamerDelegate: globalBeamerDelegate,
                );
              },
              child: StandardText.body2(
                context,
                'menu.walletDeposit'.tr().toUpperCase(),
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              getIt<NavigationService>().replaceWithNamed(
                uri: NavigationService.underConstructionRouteUri,
                data: 'Main Site',
                beamerDelegate: globalBeamerDelegate,
              );
            },
            child: ListTile(
              title: StandardText.body2(context, 'menu.mainSite'.tr()),
            ),
          ),
          InkWell(
            onTap: () {
              getIt<NavigationService>().replaceWithNamed(
                uri: NavigationService.underConstructionRouteUri,
                data: 'Contact',
                beamerDelegate: globalBeamerDelegate,
              );
            },
            child: ListTile(
              title: Row(
                children: [
                  StandardText.body2(context, 'menu.contact'.tr()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(
                        Icons.circle,
                        color: BlackBullColors.blueDark,
                        size: 8.0,
                      ),
                      SizedBox(height: 5.0, width: 12.0)
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              color: BlackBullColors.gray,
              thickness: 1.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Column(
            children: [
              // ignore: todo
              //TODO: replace with selected lang
              _menuItemSmall(
                context: context,
                icon: BlackBullIcons.icGermanFlag,
                text: 'English',
                onTap: () {
                  getIt<NavigationService>().navigateToNamed(
                    uri: NavigationService.changeLanguageRouteUri,
                    data: 'Language',
                    beamerDelegate: globalBeamerDelegate,
                  );
                },
              ),
              _menuItemSmall(
                context: context,
                icon: BlackBullIcons.menuLogout,
                text: 'menu.logout'.tr(),
                onTap: () {
                  getIt<NavigationService>().replaceWithNamed(
                    uri: NavigationService.loginRouteUri,
                    beamerDelegate: globalBeamerDelegate,
                  );
                },
              ),
              _menuItemSmall(
                context: context,
                icon: BlackBullIcons.menuDelete,
                text: 'menu.deleteAccount'.tr(),
                textColor: Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      BlackBullIcons.menuOpenLink,
                      width: 12.0,
                    ),
                    const SizedBox(width: 10.0),
                    StandardText.subtitle2(
                      context,
                      'menu.disclaimer'.tr(),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: BlackBullColors.blueDark,
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    SvgPicture.asset(
                      BlackBullIcons.menuOpenLink,
                      width: 12.0,
                    ),
                    const SizedBox(width: 10.0),
                    StandardText.subtitle2(
                      context,
                      'menu.termsConditions'.tr(),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: BlackBullColors.blueDark,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }

  InkWell _menuItem({
    required BuildContext context,
    Function()? onTap,
    required String icon,
    required String text,
  }) {
    return InkWell(
      onTap: onTap ??
          () {
            Navigator.of(context).pop();
          },
      child: ListTile(
        title: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 25.0,
            ),
            const SizedBox(width: 10.0),
            StandardText.body1(
              context,
              text,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }

  InkWell _menuItemSmall({
    required BuildContext context,
    Function()? onTap,
    required String icon,
    required String text,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap ??
          () {
            Navigator.of(context).pop();
          },
      child: SizedBox(
        height: 40.0,
        child: ListTile(
          title: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 20.0,
              ),
              const SizedBox(width: 10.0),
              StandardText.body2(
                context,
                text,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
