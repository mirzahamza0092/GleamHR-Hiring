import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/button.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/core/widgets/textfields.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/providers/applicantsdetails_provider.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_detail_info_widget.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_detail_email_widget.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_detail_notes_widget.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_info_switcher.dart';
import 'package:provider/provider.dart';

class ApplicantsDetails extends StatefulWidget {
  String applicantId, Rating;
  ApplicantsDetails({required this.applicantId, required this.Rating});

  @override
  State<ApplicantsDetails> createState() => _ApplicantsDetailsState();
}

class _ApplicantsDetailsState extends State<ApplicantsDetails> {
  String? candidateId ;
  String? setBy;
  String? changeIn;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final applicantsDetailsProvider =
          Provider.of<ApplicantsDetailsProvider>(context, listen: false);
      applicantsDetailsProvider.getEachApplicant(
          context: context, applicantId: widget.applicantId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Consumer<ApplicantsDetailsProvider>(
          builder: (context, dashBoardProvider, child) {
            if (dashBoardProvider.getActivated() == 2) {
              return FloatingActionButton(
                backgroundColor: AppColors.primaryColor,
                shape: CircleBorder(),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: CommonTextPoppins(
                              talign: TextAlign.right,
                              text: "X",
                              fontweight: FontWeight.bold,
                              fontsize: 17,
                              color: AppColors.redColor),
                        ),
                        content: Form(
                          key: context.read<ApplicantsDetailsProvider>().validatorkey,
                          child: Container(
                              height: 100,
                              child: CommonTextField(
                                controller: context.read<ApplicantsDetailsProvider>().commentController,
                                hinttext: "Add Comment...",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter comment";
                                  }
                                },
                                maxLine: 12,
                              )),
                        ),
                        actions: <Widget>[
                          Consumer<ApplicantsDetailsProvider>(
                            builder: (context, applicantDetailsProvider, child) {
                              if (applicantDetailsProvider.statusIsLoading) {
                                return circularLoading();
                              } else {
                              return CommonButton(
                              onPressed: () {
                                if (applicantDetailsProvider.validatorkey.currentState!.validate()) {
                                 applicantDetailsProvider.addComment(context: context, comment: applicantDetailsProvider.commentController.text.toString(), candidateId: widget.applicantId, setBy: Appconstants.loginResponse!.userData!.id.toString()); 
                                }
                              }, width: 137, text: "Comment",shadowneeded: false,);
                              }
                            },
                          )
                        ],
                      );
                    },
                  );
                },
                child: Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        appBar: AppBar(
        flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: horizontalgradientwidget,
        ),
        ),
        toolbarHeight: 100,
        //leadingWidth: 0,
        leading: GestureDetector(onTap: () {
          Navigator.maybePop(context);
        }, child: Icon(Icons.arrow_back,color: AppColors.whiteColor,)),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        //actions: [Icon(Icons.share_outlined,color: AppColors.whiteColor,),20.sw],
        title: SizedBox(
          width: width(context)*.7,
          child:Consumer<ApplicantsDetailsProvider>(
            builder: (context, applicantDetails, child) {
              if (applicantDetails.isLoading) {
              return SizedBox();
            }else
              {return CommonTextPoppins(
                  text: Appconstants.eachApplicantDetailModel!.candidate!.name.toString()+" "+Appconstants.eachApplicantDetailModel!.candidate!.fatherName.toString(),
                  textOverflow: TextOverflow.ellipsis,
                  fontweight: FontWeight.w500,
                  fontsize: 18.0,
                  color: AppColors.whiteColor,);}}
        ),
          ),),
        
      body:Consumer<ApplicantsDetailsProvider>(
        builder: (context, applicantDetails, child) {
          if (applicantDetails.isLoading) {
            return Center(child: CircularProgressIndicator.adaptive());
          } else {
          return  SingleChildScrollView(child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 18.0, right: 18.0),
                  child: ApplicantSwitchers(),
                ),
                //listview
                15.sh,
                Consumer<ApplicantsDetailsProvider>(
                  builder: (context, dashBoardProvider, child) {
                    if (dashBoardProvider.getActivated() == 1) {
                      return AplicantInfo(context: context, candidateId: widget.applicantId);
                    } else if (dashBoardProvider.getActivated() == 2) {
                      return ApplicantNotes(context);
                    } else {
                      return ApplicantEmail();
                    }
                  },
                )
              ],
            ));
          }
        }));
  }
}