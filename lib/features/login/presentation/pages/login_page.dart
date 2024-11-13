import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/constants/strings.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/button.dart';
import 'package:gleamhiring/core/router/app_router.dart' as route;
import 'package:gleamhiring/core/widgets/fingerprintbutton.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/core/widgets/textfields.dart';
import 'package:gleamhiring/features/login/presentation/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> loginscreenkey = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginScreenProvider =
        Provider.of<LoginScreenProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: SafeArea(
              child: Form(
                key: loginscreenkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height(context) * .025,
                    ),
                    //20.sh,
                    SvgPicture.asset(Assets.logobluesvg),
                    5.sh,
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
                                  text: "Log In",
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

                    //32.sh,
                    SizedBox(
                      height: height(context) * .03,
                    ),
                    CommonTextField(
                      maxLine: 1,
                      controller: loginScreenProvider.nameoremail,
                      hinttext: 'Email or Username ',
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
                    20.sh,
                    Consumer<LoginScreenProvider>(
                      builder: (context, loginScreenProvider, child) {
                        return CommonTextField(
                          maxLine: 1,
                          hinttext: 'Password',
                          suffixicon: GestureDetector(
                              onTap: () =>
                                  loginScreenProvider.changeVisibility(),
                              child: loginScreenProvider.visibility
                                  ?const  Icon(Icons.visibility_outlined)//Icon(Icons.visibility_off_outlined)
                                  :const  Icon(Icons.visibility_off_outlined)),//Icon(Icons.visibility_outlined)),
                          controller: loginScreenProvider.password,
                          obsecure: loginScreenProvider.visibility,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password can't be empty";
                            } else if (value.length < 6) {
                              return "Password must be greater than 6 characters";
                            } else {
                              return null;
                            }
                          },
                    );
                      },
                    ),
                    8.sh,
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(route.forgotpassword);
                        },
                        child: CommonTextPoppins(
                          text: "Forget Password ?",
                          fontweight: FontWeight.w400,
                          fontsize: 12,
                          color: AppColors.textColor,
                          talign: TextAlign.left,
                        ),
                      ),
                    ),
                    16.sh,
                    Consumer<LoginScreenProvider>(
                      builder: (context, loginScreenProvider, child) {
                        if (loginScreenProvider.isLoading) {
                          return circularLoading();
                        } else {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonButton(
                                  onPressed: () {
                                    if (loginscreenkey.currentState!
                                        .validate()) {
                                      loginScreenProvider.hitLogin(
                                          context,
                                          loginScreenProvider.nameoremail.text
                                              .toString(),
                                          loginScreenProvider.password.text
                                              .toString());
                                 }},
                                  width: width(context),
                                  text: "LOGIN"),
                                  16.sh,
                                ThumbButton(
                              ontap: () {
                                loginScreenProvider.biometric(
                                    context,
                                    loginScreenProvider.bioPermissionEnabled == "true" &&
                                            loginScreenProvider.bioMetricEnabled !=
                                                "true"
                                        ? true
                                        : false);
                              },
                              text: "Login with Fingerprint"),
                            ],
                          );
                        }
                      },
                    ),
                    10.sh,
                    KeyboardVisibilityBuilder(builder: (p0, isKeyboardVisible) {
                      if (!isKeyboardVisible) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            40.sh,
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: CommonTextPoppins(
                                  text: "Version 1.0.3",
                                  fontweight: FontWeight.w400,
                                  fontsize: 14,
                                  color: AppColors.hintTextColor),
                            ),
                            5.sh,
                          ],
                        );
                      } else {
                        return const SizedBox();
                      }
                    })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
