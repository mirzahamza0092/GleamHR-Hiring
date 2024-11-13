import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/constants/strings.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/button.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/core/widgets/textfields.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/presentation/providers/forgot_password_provider.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/presentation/widgets/backbutton.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final forgotPasswordProvider =
        Provider.of<ForgotPasswordProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body:SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SafeArea(
            child: Center(
              child: Form(
                key: forgotPasswordProvider.forgetPasswordkey,
                child: Column(
                  children: [
                    20.sh,
                    SvgPicture.asset(Assets.logobluesvg), 10.sh,
                    KeyboardVisibilityBuilder(
                      builder: (p0, isKeyboardVisible) {
                        if (!isKeyboardVisible) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                Assets.loginlogosvg,
                                width: width(context),
                                height: height(context) * .3,
                              ),
                              //Image(image: AssetImage(ImagePath.loginlogo)),
                              //20.sh,
                              SizedBox(
                                height: height(context) * .025,
                              ),
                              CommonTextPoppins(
                                  text: 'Recover Your Password',
                                  fontweight: FontWeight.w500,
                                  fontsize: 20,
                                  color: AppColors.greyColor),
                            ],
                          );
                        } else {
                          return const SizedBox(
                            height: 20,
                          );
                        }
                      },
                    ),
                    32.sh,
                    CommonTextField(
                      maxLine: 1,
                      controller: forgotPasswordProvider.nameoremail,
                      hinttext: "Email or username",
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter Your Email or Username';
                        }
                        final emailRegex = validateEmail;
                        if (emailRegex.hasMatch(value)) {
                          return null; // valid email
                        } else if (value.length < 3 || value.length > 20) {
                          return 'Username should be between 3 and 20 characters';
                        }
                        return null; // valid username
                      },
                    ),
                    16.sh,
                    Consumer<ForgotPasswordProvider>(
                      builder: (context, forgotpassword, child) {
                        if (forgotpassword.isloading) {
                          return circularLoading();
                        } else {
                          return SizedBox(
                            height: 50,
                            child: CommonButton(
                                onPressed: () {
                                  forgotPasswordProvider
                                      .hitRecoverPassword(context);
                                },
                                width: width(context),
                                text: "Recover Password"),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: height(context) * .13,
                    ),
                    SizedBox(
                        height: 50,
                        child: OutlineButton(text: "BACK TO LOGIN")),
                    16.sh,
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
