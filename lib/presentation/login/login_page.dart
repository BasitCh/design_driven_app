import 'package:black_bull_markets/presentation/login/login_form.dart';
import 'package:black_bull_markets/shared/constants/assets.dart';
import 'package:black_bull_markets/shared/core/social_login_singup.dart';
import 'package:black_bull_markets/shared/extensions/extensions.dart';
import 'package:black_bull_markets/shared/extensions/number_extensions.dart';
import 'package:black_bull_markets/shared/helpers/colors.dart';
import 'package:black_bull_markets/shared/widgets/base_scaffold.dart';
import 'package:black_bull_markets/shared/widgets/social_media_login.dart';
import 'package:black_bull_markets/shared/widgets/standard_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController email;
  late TextEditingController password;
  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      backgroundColor: BlackBullColors.blueDark,
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          //color: BlackBullColors.blueDark,
          child: AutofillGroup(
            child: Column(
              children: <Widget>[
                140.verticalGap,
                Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    BlackBullIcons.blackBullLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                30.verticalGap,
                StandardText.headline1(
                  color: BlackBullColors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  context,
                  'login.mainHeading'.tr(),
                ),
                37.verticalGap,
                SocialMediaLogin(
                  onPressedGoogle: () async {
                    UserCredential userCredential =
                        await SocialLoginSingUp.signInWithGoogle();
                    if (kDebugMode) {
                      print(
                          'userCredential.user.email ${userCredential.user!.email}',);
                    }
                  },
                  onPressedFaceBook: () async {
                    UserCredential userCredential =
                        await SocialLoginSingUp.signInWithFacebook();
                    if (kDebugMode) {
                      print(
                          'userCredential.user.email facebook ${userCredential.user!.email}',);
                    }
                  },
                  onPressedApple: () {},
                ),
                37.verticalGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    StandardText.headline1(
                        context, '.............................  ',
                        fontSize: 12.0, color: BlackBullColors.white,),
                    Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: StandardText.headline1(
                        context,
                        'login.or'.tr(),
                        fontSize: 12.0,
                        color: BlackBullColors.white,
                      ),
                    ),
                    StandardText.headline1(
                        context, '  .............................',
                        fontSize: 12.0, color: BlackBullColors.white,)
                  ],
                ),
                Container(
                  width: context.width,
                  alignment: Alignment.center,
                  //color: BlackBullColors.blueDark,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: LoginForm(email: email, password: password),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
