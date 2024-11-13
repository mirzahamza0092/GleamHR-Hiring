import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/constants/strings.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/Calendar.dart';
import 'package:gleamhiring/core/widgets/button.dart';
import 'package:gleamhiring/core/widgets/common_dropdown.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/core/widgets/textfields.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/pages/opening_details.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/providers/openings_providers.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/widgets/opening_widget.dart';
import 'package:gleamhiring/features/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OpeningsPage extends StatefulWidget {
  const OpeningsPage({super.key});

  @override
  State<OpeningsPage> createState() => _OpeningsPageState();
}

class _OpeningsPageState extends State<OpeningsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final openingProvider =
          Provider.of<OpeningsProvider>(context, listen: false);
      openingProvider.resetpage();
      openingProvider.getAllJobOpenings(context: context, pageincrement: true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Consumer<OpeningsProvider>(
      builder: (context, openingsProvider, child) {
        if (openingsProvider.isLoading && openingsProvider.page==1) {
          return Center(heightFactor: 1, child: circularLoading());
        } else {
          return LazyLoadScrollView(
            onEndOfPage: () async{
            if ((Appconstants.alljobsResponse!.data!.lastPage!) >= (openingsProvider.page)) {
            print("lastpage==--"+Appconstants.alljobsResponse!.data!.lastPage.toString()+ "page==--"+openingsProvider.page.toString());
            if (!openingsProvider.isLoading) {
            await openingsProvider.getAllJobOpenings(context: context,pageincrement: true);
            }
            }
          },
            child: ListView.builder(
              itemCount: Appconstants.alljobsResponse!.data!.data!.length+1,
              shrinkWrap: false,
              itemBuilder: (context, index) {
                if (index<Appconstants.alljobsResponse!.data!.data!.length) {
                  return Slidable(
                  closeOnScroll: true,
                  useTextDirection: true,
                  endActionPane: ActionPane(motion: ScrollMotion(), children: [
                    GestureDetector(
                      onTap: () {
                        openingsProvider.setAllValues(jobtitle: Appconstants.alljobsResponse!.data!.data![index].title.toString(),context: context,newdate: Appconstants.alljobsResponse!.data!.data![index].targetDate!);
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
                  key: openingsProvider.formkey,
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
                    CommonTextPoppins(text: "Edit Job", fontweight: FontWeight.w500, fontsize: 17, color: AppColors.textColor),
                    14.sh,
                    CommonTextField2(hinttext: "Title",
                    validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter title";
                                        }
                                        return null;
                                      }, controller: openingsProvider.jobTitle),
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
                    CommonTextField2(hinttext: "Job Description",maxLine: 4,controller: openingsProvider.jobdescription),
                    10.sh,
                    DateInputField(),
                    10.sh,
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
                    Consumer<OpeningsProvider>(
                      builder: (context, openingsProvider, child) {
                        if (openingsProvider.jobEditLoading) {
                          return circularLoading();
                        } else {
                          return CommonButton(
                            onPressed: (){
                                openingsProvider.updateJob(jobId: Appconstants.alljobsResponse!.data!.data![index].id.toString(), context: context);
                              },
                             width: 126, text: "Update",shadowneeded: false);
                        }
                      },
                    ),
                  ],),
                           ),
                         ),
               )
               ),
               );
                      },
                      child: Container(
                        width: width(context)*.25,
                      child: SvgPicture.asset(Iconss.editIcon),
                                    ),
                    ),
                  Consumer<OpeningsProvider>(
                    builder: (context, openingsProvider, child) {
                      if (openingsProvider.jobDeleteLoading) {
                        return Center(child: circularLoading());
                      } else {
                      return GestureDetector(
                    onTap: (){
                      openingsProvider.deleteJob(jobId: Appconstants.alljobsResponse!.data!.data![index].id.toString(), context: context);
                    },
                    child: Container(
                        width: width(context)*.25,
                      child: SvgPicture.asset(Iconss.deleteIcon),
                    ),
                  );
                      }
                    },
                  )
                  ]),
                  child: OpeningWidget(
                      title: Appconstants.alljobsResponse!.data!.data![index].title
                          .toString(),
                      time: Appconstants.alljobsResponse!.data!.data![index].targetDate.toString()=="null"? "Not Available":validateString(formatter.format(DateTime.parse(Appconstants.alljobsResponse!.data!.data![index].targetDate!.toString()))),
                      location: Appconstants
                          .alljobsResponse!.data!.data![index].locations!.city
                          .toString(),
                      enteriescount: validateString(Appconstants.alljobsResponse!.data!.data![index].candidateCount.toString()),
                      onPress: () {
                        Navigator.of(context).push(PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: OpeningDetails(title: Appconstants.alljobsResponse!.data!.data![index].title.toString(),jobId: Appconstants.alljobsResponse!.data!.data![index].id!,index: index,),
                          duration: const Duration(milliseconds: 500)));
                      }),
                );
                }else{
                  if (openingsProvider.isLoading) {
                    return Center(child: circularLoading());
                  }else{
                    return SizedBox();
                  }
                }
                },
            ),
          );
        }
      },
    ));
  }
}
