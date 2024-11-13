import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/constants/strings.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:gleamhiring/features/logout/presentation/pages/logout_view.dart';
import 'package:provider/provider.dart';

Widget appDrawer({required BuildContext context}) {
  return SafeArea(
    child: Drawer(
      width: width(context) * .8,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:24),
              decoration: BoxDecoration(
                border: Border(
      bottom: BorderSide(color: Colors.black.withOpacity(.15),width: 1.0,),
      ),),
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SvgPicture.asset(Assets.gleamhiringlogoIcon,width: 98,height: 26,),GestureDetector(onTap: () => Navigator.of(context).pop(), child: Icon(Icons.menu,color: AppColors.primaryColor,)),],)),
            ListTile(
                  onTap: (){
                    Navigator.of(context).pop();
                    context.read<DashBoardProvider>().changeActivated(1);
                  },
                  trailing: SizedBox(),
                  leading: SvgPicture.asset(Iconss.openingicon.toString()),
                  title: CommonTextPoppins(text: "Openings",talign: TextAlign.start, fontweight: FontWeight.w400, fontsize: 16, color: AppColors.textColor),),
            ListTile(
                  onTap: (){
                    Navigator.of(context).pop();
                    context.read<DashBoardProvider>().changeActivated(2);
                  },
                  trailing: SizedBox(),
                  leading: SvgPicture.asset(Iconss.applicantsicon.toString()),
                  title: CommonTextPoppins(text: "Applicants",talign: TextAlign.start, fontweight: FontWeight.w400, fontsize: 16, color: AppColors.textColor),),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: drawerDataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: drawerDataList[index].onTap,
                  trailing: drawerDataList[index].trailing,
                  leading: SvgPicture.asset(drawerDataList[index].imagepath.toString()),
                  title: CommonTextPoppins(text: drawerDataList[index].title.toString(),talign: TextAlign.start, fontweight: FontWeight.w400, fontsize: 16, color: AppColors.textColor),);
              },
            ),
            Consumer<DashBoardProvider>(
              builder: (context, dashBoardProvider, child) {
                return ListTile(
                  leading: SvgPicture.asset(Iconss.thumbicon.toString(),width: 30,height: 30,color: AppColors.textColor,),
                  trailing: SizedBox(
                    width: 30,
                    height: 30,
                    child: Transform.scale(
                      scale: .6,
                      child: Switch(                    
                                  onChanged: (val)async{
                                    bool authenticated = await userAuthorization(reason: "For Biometric");
                                    if (val && authenticated) {
                                    dashBoardProvider.changeBioMetricStatus(val);
                                            return await showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              elevation: 0,
                                              title: CommonTextPoppins(text: 'You have to enter credentials first time when login', fontweight: FontWeight.w400, fontsize: 16, color: AppColors.textColor),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () => Navigator.of(context).pop(false),
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            ),
                                          );
                                        }else if(authenticated){
                                          dashBoardProvider.changeBioMetricStatus(val);
                                        }
                                  },
                                  value: dashBoardProvider.enabledBioStatus,
                                  activeColor: Colors.white,
                                  activeTrackColor: AppColors.primaryColor,
                                  inactiveThumbColor: AppColors.primaryColor,
                                  inactiveTrackColor: Colors.white,
                                ),
                    ),
                  ),
                  title: CommonTextPoppins(text: "Enable biometric",talign: TextAlign.start, fontweight: FontWeight.w400, fontsize: 16, color: AppColors.textColor),);
              },
            ),
            logoutView(context),
          ],
        ),
      ),
    ),
  );
}