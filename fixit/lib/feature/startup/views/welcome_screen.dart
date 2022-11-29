import 'package:fixit/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../core/base/base_view.dart';
import '../../../utils/assets.dart';
import '../../../utils/colors.dart';
import '../../../utils/screen_size.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/k_button.dart';
import '../../authentication/controllers/authentication_controller.dart';
import '../../authentication/views/login_screen.dart';
import '../../authentication/views/sign_up_screen.dart';

class WelcomeScreen extends BaseView {
  @override
  ConsumerState<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends BaseViewState<WelcomeScreen> {
  @override
  Widget body() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: ListifySize.height(288)),
        Container(
          width: ListifySize.width(439),
          child: Text(
            "Start Using Listify App Today!",
            textAlign: TextAlign.center,
            style: ListifyTextStyle.headLine3,
          ),
        ),
        SizedBox(height: ListifySize.height(61)),
        KFilledButton(
          buttonText: 'Create Account',
          onPressed: () => SignupScreen().push(context),
        ),
        SizedBox(height: ListifySize.height(106)),
        Text(
          "Or",
          textAlign: TextAlign.center,
          style: ListifyTextStyle.bodyText1(),
        ),
        SizedBox(height: ListifySize.height(87)),
        KOutlinedButton.iconText(
          buttonText: 'Sign up with Google',
          assetIcon: ListifyAssets.google,
          onPressed: () =>
              ref.read(authenticationProvider.notifier).signInWithGoogle(),
        ),
        SizedBox(height: ListifySize.height(37)),
        KOutlinedButton.iconText(
          buttonText: 'Sign up with Facebook',
          assetIcon: ListifyAssets.facebook,
          onPressed: () => snackBar(context,
              title: "Feature is not available yet",
              backgroundColor: ListifyColors.charcoal),
        ),
        SizedBox(height: ListifySize.height(308)),
        Text(
          "Already have an account?",
          textAlign: TextAlign.center,
          style: ListifyTextStyle.bodyText3(),
        ),
        SizedBox(height: ListifySize.height(6)),
        KTextButton(
            buttonText: "Login",
            onPressed: () {
              LoginScreen().push(context);
            })
      ],
    );
  }
}
