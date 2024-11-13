import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/providers/applicantsdetails_provider.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_info_listtile.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/candidate_info_tile.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/commonDropDown.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/documents_tile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

//Applicant Information Widget
Container AplicantInfo({required BuildContext context,required String candidateId}) {
  return Container(
    child: Consumer<ApplicantsDetailsProvider>(
      builder: (context, applicantDetails, child) {
        if (applicantDetails.isLoading) {
          return Center(child: circularLoading());
        } else {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //listview
            applicantInfoListTile(imagepath: Appconstants.eachApplicantDetailModel!.candidate!.avatar.toString(), name: Appconstants.eachApplicantDetailModel!.candidate!.name.toString(), location: Appconstants.eachApplicantDetailModel!.candidate!.desiredLocation!.name.toString(), appliedTime: Appconstants.eachApplicantDetailModel!.difference.toString()),
        //rating
        // Padding(
        //   padding: const EdgeInsets.only(left: 100.0,bottom: 13),
        //   child: RatingStars(
        //     //valueLabelTextStyle: TextStyle(color: AppColors.textColor,fontWeight: FontWeight.w500,fontSize: 12),
        //     starCount: 5,
        //     value: Appconstants.eachApplicantDetailModel!.currentRating.toString()=="null"?0
        //     :double.parse(labelll.toString()),
        //     starSpacing: 5,
        //      starColor: AppColors.ratingColor,
        //      starOffColor: AppColors.unratingColor,
        //      valueLabelVisibility: false,
        //     onValueChanged: (newValue) {
        //       //rating
        //     ApplicantsDetailsProvider provider = Provider.of<ApplicantsDetailsProvider>(context, listen: false);
        //     provider.updateRating(context: context,
        //     changeIn: "Rating",
        //       setBy: Appconstants.loginResponse!.userData!.id.toString(),
        //       candidateId: Appconstants.eachApplicantDetailModel!.candidate!.id.toString(),newValue: newValue);
        //     print("New rating: $newValue");
        //     },
        //     ),
        // ),
        //         10.sh,
                //rating
                Padding(
                  padding: const EdgeInsets.only(left: 18, right: 18, top: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextPoppins(
                          text: "Reviews",
                          fontweight: FontWeight.w500,
                          fontsize: 14,
                          color: AppColors.blackColor),
                      10.sh,
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                            color: AppColors.fillColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: width(context),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 18.0, right: 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RatingStars(
                                  starCount: 5,
                                  value:double.parse(applicantDetails.labelll.toString()),
                                  starSpacing: 5,
                                  starColor: AppColors.ratingColor,
                                  starOffColor: AppColors.unratingColor,
                                  onValueChanged: (newValue) {
              //rating
            ApplicantsDetailsProvider provider = Provider.of<ApplicantsDetailsProvider>(context, listen: false);
            provider.updateRating(context: context,
            changeIn: "Rating",
              setBy: Appconstants.loginResponse!.userData!.id.toString(),
              candidateId: Appconstants.eachApplicantDetailModel!.candidate!.id.toString(),newValue: newValue);
            print("New rating: $newValue");
            },
                                  valueLabelVisibility: false),
                              CommonTextPoppins(
                                  text:
                                      "${Appconstants.eachApplicantDetailModel!.currentRating.toString() == "null" ? 0 :applicantDetails.labelll.toString()!="null"? double.parse(applicantDetails.labelll.toString()):0}/5",
                                  fontweight: FontWeight.w500,
                                  fontsize: 14,
                                  color: AppColors.blackColor)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                10.sh,
                //rating
                Padding(
                  padding:
                      const EdgeInsets.only(left: 18, right: 18, bottom: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonTextPoppins(
                          text: "Status",
                          fontweight: FontWeight.w500,
                          fontsize: 14,
                          color: AppColors.blackColor),
                      10.sh,
                      Consumer<ApplicantsDetailsProvider>(
                        builder: (context, applicantDetail, child) {
                          if (applicantDetail.statusIsLoading) {
                            return Center(child: circularLoading());
                          } else {
                            return CommonDropDown(
                        selectedText: applicantDetail.selectedStatus,
                        width: width(context),
                        listItem: applicantDetail.statusTypes,
                        onchanged: (val) {
                          applicantDetail.changeStatus(val: val,context: context,candidateId: candidateId,setBy: Appconstants.loginResponse!.userData!.id.toString());
                        },
                      );
                          }
                        },
                      )
                    ],
                  ),
                ),

                8.sh,
                //cv view
                Appconstants.eachApplicantDetailModel!.candidate!
                            .candidateCvDetails
                            .toString() ==
                        "null"
                    ? SizedBox()
                    : documentTile(
                        leadingImagePath: Iconss.pdficonpng,
                        filetype: ".png",
                        title: "CV"+getextension(Appconstants.eachApplicantDetailModel!.candidate!.answers![0]["answer"].toString()),
                        viewontap: () async{
                          String url =
                              "https://${Appconstants.domain}.gleamhrm.com/" +
                                  Appconstants.eachApplicantDetailModel!
                                      .candidate!.answers![0]["answer"];
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        downloadontap: () async{
                          String url= "https://${Appconstants.domain}.gleamhrm.com/"+Appconstants.eachApplicantDetailModel!.candidate!.answers![0]["answer"].toString();
                          await downloadFile(url,context,Appconstants.eachApplicantDetailModel!.candidate!.id.toString()+Appconstants.eachApplicantDetailModel!.candidate!.name.toString()+"CV");
                        },
                        downloadedNeeded: true,
                        viewNeeded: getextension(Appconstants.eachApplicantDetailModel!.candidate!.answers![0]["answer"].toString())=='.docx' || getextension(Appconstants.eachApplicantDetailModel!.candidate!.answers![0]["answer"].toString())=='.doc'?false : true),
                8.sh,
                // documentTile(
                //     leadingImagePath: Iconss.suitabilityIcon,
                //     filetype: "",
                //     title: "Suitability Score",
                //     viewontap: () {
                //       print(Appconstants.eachApplicantDetailModel!.candidate!
                //           .candidateCvDetails
                //           .toString());
                //     },
                //     downloadontap: () {},
                //     downloadedNeeded: false,
                //     viewNeeded: false,
                //     percentage: '75%'),
                // 8.sh,
                //applicants questions
                // Appconstants.eachApplicantDetailModel!.candidate!.answers
                //             .toString() ==
                //         "null"
                //     ? SizedBox()
                //     : documentTile(
                //         leadingImagePath: Iconss.questionsIcon,
                //         filetype: ".svg",
                //         title:
                //             "Applicants Questions (${Appconstants.eachApplicantDetailModel!.candidate!.answers!.length})",
                //         viewontap: () async {
                //           String url =
                //               "https://${Appconstants.domain}.gleamhrm.com/" +
                //                   Appconstants.eachApplicantDetailModel!
                //                       .candidate!.answers![0]["answer"];
                //           if (await canLaunch(url)) {
                //             await launch(url);
                //           } else {
                //             throw 'Could not launch $url';
                //           }
                //         },
                //         downloadontap: () {},
                //         downloadedNeeded: false,
                //         viewNeeded: true),
                //candidate info
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: CommonTextPoppins(
                    text: "CANDIDATE INFO",
                    fontweight: FontWeight.w600,
                    fontsize: 12,
                    color: AppColors.textColor,
                    talign: TextAlign.left,
                  ),
                ),
                //phone tile
                candidateInfoTile(
                    title: "Phone",
                    subtitle: Appconstants
                        .eachApplicantDetailModel!.candidate!.mobileNumber
                        .toString(),
                    icon: Iconss.phoneicon,
                    ontap: () async {
                      String phone = Appconstants
                          .eachApplicantDetailModel!.candidate!.mobileNumber
                          .toString();
                      if (await canLaunch("tel:${phone}")) {
                        await launch("tel:${phone}");
                      } else {
                        throw 'Could not call on this $phone';
                      }
                    }),
                //email tile
                candidateInfoTile(
                    title: "Email",
                    subtitle: Appconstants
                        .eachApplicantDetailModel!.candidate!.email
                        .toString(),
                    icon: Iconss.messageicon,
                    ontap: () async {
                      String email = Appconstants
                          .eachApplicantDetailModel!.candidate!.email
                          .toString();
                      String subject = "";
                      String body = "";
                      if (await canLaunch(
                          "mailto:$email?subject=$subject&body=$body")) {
                        await launch(
                            "mailto:$email?subject=$subject&body=$body");
                      } else {
                        throw 'Could not send email to $email';
                      }
                    }),
                //addresstile tile
                //candidateInfoTile(title: "Address", subtitle: "Iqbal Chowk, Mohalla Muslimabad, Gujrat, 50700, Punjab, Pakistan", icon: Iconss.locationicon, ontap: (){}),
              ],
            ),
          );
        }
      },
    ),
  );
}

//Applicant Notes Comment Widget
