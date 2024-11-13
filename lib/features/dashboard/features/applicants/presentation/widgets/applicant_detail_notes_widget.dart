import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/providers/applicantsdetails_provider.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_detail_comment_widget.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_detail_history_widget.dart';
import 'package:gleamhiring/features/dashboard/presentation/widgets/switchbutton.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

//Applicant Notes Widget
Container ApplicantNotes(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Divider(height: 2, color: AppColors.fillColor),
        Consumer<ApplicantsDetailsProvider>(
            builder: (context, dashboardProvider, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 7),
            child: Row(
              children: [
                Expanded(
                    child: NotesSwitchButton(
                  onPressed: () {
                    dashboardProvider.changeNotesActivated(2);
                  },
                  width: width(context),
                  text: "Comments",
                  isactivated:
                      dashboardProvider.getNotesActivated() == 2 ? true : false,
                  height: 36,
                )),
                7.sw,
                Expanded(
                    child: NotesSwitchButton(
                  onPressed: () {
                    dashboardProvider.changeNotesActivated(1);
                  },
                  width: width(context),
                  text: "History",
                  isactivated:
                      dashboardProvider.getNotesActivated() == 1 ? true : false,
                  height: 36,
                )),
              ],
            ),
          );
        }),
        Divider(height: 2, color: AppColors.fillColor),
        Consumer<ApplicantsDetailsProvider>(
          builder: (context, dashBoardProvider, child) {
            if (dashBoardProvider.getNotesActivated() == 2) {
              return Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: Container(
                  height: height(context) * .58,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: Appconstants.eachApplicantDetailModel!.comments!.length,
                        itemBuilder: (context, index) {
                          return ApplicantCommentWidget(
                              name: Appconstants.loginResponse!.userData!.id.toString()== Appconstants.eachApplicantDetailModel!.comments![index].setBy.toString()?"You":Appconstants.eachApplicantDetailModel!.comments![index].candidateSetBy!.firstname.toString(),
                              imagepath: Appconstants.eachApplicantDetailModel!.comments![index].candidateSetBy!.picture.toString()=="null"?"":Appconstants.eachApplicantDetailModel!.comments![index].candidateSetBy!.picture.toString(),
                              description:
                                  Appconstants.eachApplicantDetailModel!.comments![index].comment.toString(),
                              date: Appconstants.eachApplicantDetailModel!.comments![index].createdAt.toString()=="null"?"": DateFormat('MMMM d, yyyy, hh:mm a').format(DateTime.parse(Appconstants.eachApplicantDetailModel!.comments![index].createdAt.toString())),
                              context: context);
                        }),
                  ),
                ),
              );
            } else {
              return Container(
                height: height(context) * .59,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 18.0, right: 18.0, top: 18.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: Appconstants.eachApplicantDetailModel!.status!.length,
                            itemBuilder: (context, index) {
                              return Appconstants.eachApplicantDetailModel!.status![index].changeIn.toString()!="Rating"?SizedBox():Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  applicantHistoryWidget(
                                      title: "Rated set to",
                                      subtitle: Appconstants.eachApplicantDetailModel!.status![index].setBy!.toString()=="null"?"":Appconstants.loginResponse!.userData!.id.toString()== Appconstants.eachApplicantDetailModel!.status![index].setBy!.toString()?"You":Appconstants.eachApplicantDetailModel!.status![index].candidateSetBy!.firstname!.toString(),
                                      icon: Iconss.starIcon,
                                      date: Appconstants.eachApplicantDetailModel!.status![index].createdAt.toString()=="null"?"": DateFormat('MMMM d, yyyy, hh:mm a').format(DateTime.parse(Appconstants.eachApplicantDetailModel!.status![index].createdAt.toString())),
                                      star: Appconstants.eachApplicantDetailModel!.status![index].status!.toString()=="null"?0:double.parse(Appconstants.eachApplicantDetailModel!.status![index].status!.toString())),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 28.0),
                                    child: Container(
                                      height: 40,
                                      width:
                                          2, // Adjust the width of the vertical divider
                                      color: AppColors.fillColor,
                                    ),
                                  ),
                                ],
                              );
                            }),
                        // applicantHistoryWidget(
                        //     title: "",
                        //     subtitle: "",
                        //     icon: "",
                        //     date: "",
                        //     star: 0),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        )
      ],
    ),
  );
}
