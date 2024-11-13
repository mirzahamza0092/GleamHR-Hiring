import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/button.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/domain/presentation/providers/domain_provider.dart';
import 'package:provider/provider.dart';

class DomainScreen extends StatelessWidget {
  const DomainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final domainScreenController =
        Provider.of<DomainScreenProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SafeArea(
            child: Center(
              child: Form(
                key: domainScreenController.domainScreenFormKey,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        20.sh,
                        SvgPicture.asset(Assets.gleamhiringlogoIcon),
                        KeyboardVisibilityBuilder(
                            builder: (p0, isKeyboardVisible) {
                          if (isKeyboardVisible) {
                            return const SizedBox();
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(Assets.domainlogosvg),
                                CommonTextPoppins(
                                    text: 'Enter Your Domain',
                                    fontweight: FontWeight.w500,
                                    fontsize: 20,
                                    color: AppColors.greyColor),
                              ],
                            );
                          }
                        }),
                        32.sh,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.fillColor,
                          ),
                          height: 55,
                          width: width(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: FittedBox(
                                    child: CommonTextPoppins(
                                        text: "https://",
                                        fontweight: FontWeight.w400,
                                        fontsize: 14,
                                        talign: TextAlign.left,
                                        color: AppColors.hintTextColor),
                                  )),
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: domainScreenController.domain,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      domainScreenController
                                          .isDomainEntered(true);
                                    } else {
                                      domainScreenController
                                          .isDomainEntered(false);
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Your domain',
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: FittedBox(
                                    child: CommonTextPoppins(
                                        text: ".gleamhr.com",
                                        fontweight: FontWeight.w400,
                                        fontsize: 14,
                                        talign: TextAlign.right,
                                        color: AppColors.hintTextColor),
                                  )),
                            ],
                          ),
                        ),
                        10.sh,
                        Container(
                              padding: const EdgeInsets.only(left: 5),
                              alignment: Alignment.topLeft,
                              child: Consumer<DomainScreenProvider>(
                        builder: (context, provider, child) {
                          return Container(
                            padding: const EdgeInsets.only(left: 5),
                            alignment: Alignment.topLeft,
                            child: Visibility(
                                visible: domainScreenController.domainEntered,
                                child: CommonTextPoppins(
                                    text: "Enter Your Domain",
                                    fontweight: FontWeight.w400,
                                    talign: TextAlign.left,
                                    fontsize: 15,
                                    color: AppColors.primaryColor)),
                          );
                        },
                      ),
                            ),
                        16.sh,
                        Consumer<DomainScreenProvider>(
                        builder: (context, provider, child) {
                          if (provider.isLoading == false) {
                            return CommonButton(
                              text: 'Continue',
                              width: width(context),
                              onPressed: () {
                                domainScreenController.enterDomain(context);
                                print(domainScreenController.domain.text);
                                //
                              },
                            );
                          } else {
                            return circularLoading();
                          }
                        },
                      ),
                    KeyboardVisibilityBuilder(builder: (p0, isKeyboardVisible) {
                      if (!isKeyboardVisible) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: height(context) * .14,
                            ),
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
                    }),
                  ],
                ),
                  ]),
            ),
          ),
        )
    ));
}}