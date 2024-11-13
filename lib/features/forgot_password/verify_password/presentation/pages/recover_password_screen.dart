import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/button.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/core/widgets/textfields.dart';
import 'package:gleamhiring/features/forgot_password/recover_password/presentation/providers/forgot_password_provider.dart';
import 'package:gleamhiring/features/forgot_password/verify_password/presentation/providers/verifypassword_provider.dart';
import 'package:provider/provider.dart';

class VerifyPassword extends StatefulWidget {
  const VerifyPassword({super.key});

  @override
  State<VerifyPassword> createState() => _VerifyPasswordState();
}

class _VerifyPasswordState extends State<VerifyPassword> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final verifyPasswordProvider =
        Provider.of<VerifyPasswordProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Center(
            child: Form(
              key: verifyPasswordProvider.verifyPasswordkey,
              child: Column(
                children: [
                  20.sh,
                  SvgPicture.asset(Assets.logobluesvg),
                  KeyboardVisibilityBuilder(
                    builder: (p0, isKeyboardVisible) {
                      if (!isKeyboardVisible) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(Assets.recoverpasswordlogosvg),
                            SizedBox(
                              height: height(context) * .025,
                            ),
                            CommonTextPoppins(
                                text: 'Verify OTP',
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
                  // Visibility(
                  //   visible: _isVisible,
                  //   child: Expanded(
                  //     child: Align(
                  //       child: Padding(
                  //         padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 0),
                  //         child: SizedBox(
                  //           width: double.infinity,
                  //           height: 55.0,
                  //           child: DecoratedBox(
                  //             decoration: BoxDecoration(
                  //                 color: Color(0xFFFBF5E9),
                  //                 borderRadius:
                  //                     BorderRadius.all(Radius.circular(5)),
                  //                 shape: BoxShape.rectangle,
                  //                 border: Border.all(color: Color(0xFFFAAF2D))),
                  //             child: Padding(
                  //               padding: const EdgeInsets.fromLTRB(10, 18, 0, 10),
                  //               child: Text(
                  //                 'We have Email you password reset link!',
                  //                 style: TextStyle(
                  //                   color: Color(0xFFFAAF2D),
                  //                   fontSize: 16.0,
                  //                   letterSpacing: 0.4,
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),

                  CommonTextField(
                      maxLine: 1,
                      isEditable: false,
                      controller:
                          context.read<ForgotPasswordProvider>().nameoremail,
                      hinttext: "youremail@gmail.com",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email can't be empty";
                        } else {
                          return null;
                        }
                      }),
                  16.sh,
                  CommonTextField(
                    maxLine: 1,
                    controller: verifyPasswordProvider.password,
                    hinttext: "OTP",
                    obsecure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Otp can't be empty";
                      } else if (value.length < 5) {
                        return "Otp must be 5 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  16.sh,
                  Consumer<VerifyPasswordProvider>(
                    builder: (context, verifyotp, child) {
                      if (verifyotp.isloading == true) {
                        return circularLoading();
                      } else {
                        return CommonButton(
                            onPressed: () {
                              verifyPasswordProvider.hitVerifyPassword(context);
                            },
                            width: width(context),
                            text: "VERIFY OTP");
                      }
                    },
                  ),
                  16.sh,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
