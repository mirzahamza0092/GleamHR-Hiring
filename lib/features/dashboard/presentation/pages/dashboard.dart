import 'package:flutter/material.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/button.dart';
import 'package:gleamhiring/core/widgets/common_dropdown.dart';
import 'package:gleamhiring/core/widgets/drawer.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/core/widgets/textfields.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/pages/applicants_page.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/pages/openings_page.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:gleamhiring/features/dashboard/presentation/widgets/appbar.dart';
import 'package:gleamhiring/features/dashboard/presentation/widgets/dashboard_switcher.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/Calendar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
  final dashBoardProvider =
      Provider.of<DashBoardProvider>(context, listen: false);
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 0,
            title: Text('Exit App'),
            content: Text('Do you want to exit GleamHR Hiring?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () async{
            if (dashBoardProvider.getActivated()==1) {
              //add job opening code
              showDialog(
          context: context,
          builder: (context) => AlertDialog(
            
            backgroundColor: AppColors.whiteColor,
            surfaceTintColor: Colors. transparent,
             content: Container(
              height: 527,
              width: 393,
               child: SingleChildScrollView(
                         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                         child: Form(
                key: dashBoardProvider.formkey,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //30.sw,
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.close)
                        //SvgPicture.asset("assets/icons/CrossIcon.svg"),
                      ),
                      //20.sw,
                     
                    ],
                  ),
                  10.sh,
                  CommonTextPoppins(text: "Add Job", fontweight: FontWeight.w500, fontsize: 17, color: AppColors.textColor),
                  14.sh,
                  // Consumer<DashBoardProvider>(
                  //   builder: (context, dashBoardProvider, child) {
                  //     return CommonDropDown
                  //     (width: width(context), selectedText: dashBoardProvider.position.toString(),
                  //      listItem: dashBoardProvider.positionList, 
                  //      onchanged: (val){dashBoardProvider.changePosition(val);}
                  //      );
                  //   },
                  // ),
                  CommonTextField2(hinttext: "Title",
                  validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter title";
                                      }
                                      return null;
                                    }, controller: dashBoardProvider.jobTitle),
                  10.sh,
                  //position
                  Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashBoardProvider.position.toString(),
                      listItem: dashBoardProvider.positionList,
                       onchanged: (val){dashBoardProvider.changePosition(val);});
                  },
                ),
                 
                  10.sh,
                  CommonTextField2(hinttext: "Job Description",maxLine: 4,
                  validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter valid job description";
                                      }
                                      return null;
                                    }, controller: dashBoardProvider.jobdescription),
                  10.sh,
                  DateInputField(),
                  
                                    10.sh,
                    //Experience
                                    Consumer<DashBoardProvider>(
                  builder: (context, dashboardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashboardProvider.experience,
                      listItem: dashboardProvider.experienceList,
                       onchanged: (val){dashboardProvider.changeExperience(val);});
                  },
                ),
                10.sh,
                //Job Status
                                    Consumer<DashBoardProvider>(
                  builder: (context, dashboardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashboardProvider.JobStatus,
                      listItem: dashboardProvider.jobStatusList,
                       onchanged: (val){dashboardProvider.changeJobStatus(val);});
                  },
                ),
                                    10.sh,
                     //Employment Status               
                     Consumer<DashBoardProvider>(
                  builder: (context, dashboardProvider, child) {
                   // print("99999"+dashboardProvider.employmentStatus.toString());
                   // print("99999"+dashboardProvider.employmentStatusList.toString());
                    return CommonDropDown2(width: width(context),
                     selectedText: dashboardProvider.employmentStatus!,
                      listItem: dashboardProvider.employmentStatusList,
                       onchanged: (val){dashboardProvider.changedesiredEmploymentStatus(val);});
                  },
                ),
                                    10.sh,
                   //Hiring Lead                 
                   Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashBoardProvider.hiringLead.toString(), 
                     listItem: dashBoardProvider.hiringLeadList,
                      onchanged: (val){dashBoardProvider.changedesiredHiringLead(val);}
                      );
                  },
                ),
                                    10.sh,
                    //Department                
                                    Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashBoardProvider.jobdepartment.toString(), 
                     listItem: dashBoardProvider.jobdepartmentList,
                      onchanged: (val){dashBoardProvider.changedesiredDepartment(val);}
                      );
                  },
                ),
                10.sh,
                //Division
                Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashBoardProvider.divison.toString(), 
                     listItem: dashBoardProvider.divisonList,
                      onchanged: (val){dashBoardProvider.changedsiredDivison(val);}
                      );
                  },
                ),
                10.sh,
                //Designation
                Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashBoardProvider.designation.toString(), 
                     listItem: dashBoardProvider.designationList,
                      onchanged: (val){dashBoardProvider.changedesiredDesignation(val);}
                      );
                  },
                ),
                 
                10.sh,
                //Location
                Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown2(width: width(context),
                     selectedText: dashBoardProvider.jobLocation.toString(), 
                     listItem: dashBoardProvider.jobLocationList,
                      onchanged: (val){dashBoardProvider.changedesiredLocation(val);}
                      );
                  },
                ),
                                                      
                  25.sh,
                  Consumer<DashBoardProvider>(
                    builder: (context, dashBoardProvider, child) {
                      if (dashBoardProvider.isLoading) {
                        return const Center(child: CircularProgressIndicator.adaptive());
                      } else {
                        return CommonButton(
                          onPressed: (){dashBoardProvider.addJob(context: context);},
                           width: 126, text: "ADD JOB",shadowneeded: false);
                      }
                    },
                  ),
                ],),
                         ),
                       ),
             )
             ),
             );
            } else {
          showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: AppColors.whiteColor,
            surfaceTintColor: Colors. transparent,
             content: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Form(
              key: dashBoardProvider.formkey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                CommonTextPoppins(text: "Add Candidate", fontweight: FontWeight.w500, fontsize: 17, color: AppColors.textColor),
                14.sh,
                Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown(width: width(context), selectedText: dashBoardProvider.position.toString(), listItem: dashBoardProvider.positionList, onchanged: (val){dashBoardProvider.changePosition(val);});
                  },
                ),
                10.sh,
                CommonTextField(hinttext: "Candidate Name",validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter candidate name";
                                    }
                                    return null;
                                  }, controller: dashBoardProvider.empName),
                10.sh,
                CommonTextField(hinttext: "Father Name",validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter father name";
                                    }
                                    return null;
                                  }, controller: dashBoardProvider.empFatherName),
                10.sh,
                CommonTextField(hinttext: "Email",validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter email";
                                    }
                                    return null;
                                  }, controller: dashBoardProvider.empEmail),
                10.sh,
                CommonTextField(hinttext: "Phone Number",showNumber: true, validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter phone number";
                                    }
                                    return null;
                                  }, controller: dashBoardProvider.empPhone),
                10.sh,
                Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    return CommonDropDown(width: width(context), selectedText: dashBoardProvider.jobLocation.toString(), listItem: dashBoardProvider.jobLocationList, onchanged: (val){dashBoardProvider.changedesiredLocation(val);});
                  },
                ),
                10.sh,
                Consumer<DashBoardProvider>(
                  builder: (context, dashboardProvider, child) {
                    return CommonDropDown(width: width(context), selectedText: dashboardProvider.empStatus, listItem: dashboardProvider.statusList, onchanged: (val){dashboardProvider.changeEmpStatus(val);});
                  },
                ),
                25.sh,
                Consumer<DashBoardProvider>(
                  builder: (context, dashBoardProvider, child) {
                    if (dashBoardProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    } else {
                      return CommonButton(onPressed: (){dashBoardProvider.addApplicant(context: context);}, width: width(context), text: "Add Candidate",shadowneeded: false);
                    }
                  },
                ),
              ],),
            ),
          )
             ),);
          }
            },
          child: Container(width:60, height:60, decoration: BoxDecoration(gradient: gradientwidget, borderRadius: BorderRadius.circular(50)),
            child: Icon(Icons.add,color: AppColors.whiteColor,),
          ),
        ),
        drawer: appDrawer(context: context),
        appBar: PreferredSize(preferredSize: Size(width(context), 90),child: const CommonAppBar()),
        body: Column(children: [
          19.sh,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 28),
            child: DashBoardSwitchers(),
          ),
          15.sh,
          Consumer<DashBoardProvider>(
            builder: (context, dashBoardProvider, child) {
              if (dashBoardProvider.getActivated()==1) {
                return const OpeningsPage();
              } else {
                return const ApplicantsPage();
              }
            },
          )
        ],),
        ),
    );
  }
}