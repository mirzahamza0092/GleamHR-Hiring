import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/assets.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/utils/snackbar.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicant_info_listtile.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/candidate_info_tile.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/documents_tile.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/jobapplicants_model.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/pages/openingspeople_detailsinfo.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class OpeningPeopleDetails extends StatelessWidget {
  Applicant openingPeopleDetails;
  int index;
  OpeningPeopleDetails({required this.openingPeopleDetails,required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: horizontalgradientwidget,
      ),
      ),
      toolbarHeight: 100,
      leading: GestureDetector(onTap: () {
        Navigator.maybePop(context);
      }, child: Icon(Icons.arrow_back,color: AppColors.whiteColor,)),
      centerTitle: true,
      backgroundColor: AppColors.primaryColor,
      actions: [
        28.sw,
        //Icon(Icons.share_outlined,color: AppColors.whiteColor,),
        20.sw
        ],
      title: SizedBox(
        width: width(context)*.7,
        child: CommonTextPoppins(
                text: openingPeopleDetails.name.toString()+ " " + openingPeopleDetails.fatherName.toString(),
                textOverflow: TextOverflow.ellipsis,
                fontweight: FontWeight.w500,
                fontsize: 18.0,
                color: AppColors.whiteColor),
      ),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        InkWell(onTap: () => Navigator.of(context).push(PageTransition(
          type: PageTransitionType.bottomToTop,
          child: OpeningsPeoplesDetailsInfo(openingPeopleDetails: openingPeopleDetails,index:index),
          duration: const Duration(milliseconds: 500))), child: applicantInfoListTile(imagepath: openingPeopleDetails.avatar.toString(), name: openingPeopleDetails.name.toString(), location: openingPeopleDetails.city.toString(), appliedTime:openingPeopleDetails.job!.createdAt==null? "Not Available":timeAgo(openingPeopleDetails.job!.createdAt!))),
          openingPeopleDetails.candidateCvDetails.toString()=="null"?SizedBox(): documentTile(leadingImagePath: Iconss.pdficonpng,filetype: ".png", title: "CV"+getextension(openingPeopleDetails.answers![0].answer.toString()), viewontap: ()async{
          String url= "https://${Appconstants.domain}.gleamhrm.com/"+openingPeopleDetails.answers![0].answer.toString();
          if(await canLaunchUrl(Uri.parse(url))){
          await launchUrl(Uri.parse(url));
          }else {
            throw 'Could not launch $url';
          }
        }, downloadontap: ()async{
          String url= "https://${Appconstants.domain}.gleamhrm.com/"+openingPeopleDetails.answers![0].answer.toString();
          await downloadFile(url,context,openingPeopleDetails.id.toString()+openingPeopleDetails.name.toString()+"CV");
        }, downloadedNeeded: true, viewNeeded: getextension(openingPeopleDetails.answers![0].answer.toString())=='.docx' || getextension(openingPeopleDetails.answers![0].answer.toString())=='.doc'?false : true),
        8.sh,
        //candidate info
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CommonTextPoppins(text: "CANDIDATE INFO", fontweight: FontWeight.w600, fontsize: 12, color: AppColors.textColor,talign: TextAlign.left,),
        ),
        candidateInfoTile(title: "Phone", subtitle: openingPeopleDetails.mobileNumber.toString(), icon: Iconss.phoneicon, ontap: ()async{
                    String phone=openingPeopleDetails.mobileNumber.toString();
       if (phone!="null") {
          if(await canLaunch("tel:${phone}")){
        await launch("tel:${phone}");
      }else {
        throw 'Could not call on this $phone';
      }  
       } else {
       ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Number not available"));  
       }
       
        }),
        candidateInfoTile(title: "Email", subtitle: openingPeopleDetails.email.toString(), icon: Iconss.messageicon, ontap: ()async{
          String email=openingPeopleDetails.email.toString();
          String subject="";
          String body="";
         if (email!="null") {
          if(await canLaunch("mailto:$email?subject=$subject&body=$body")){
        await launch("mailto:$email?subject=$subject&body=$body");
      }else {
        throw 'Could not send email to $email';
      }    
         }else{
          ScaffoldMessenger.of(context).showSnackBar(appSnackBar("Email not available"));  
         }
        }),
      ],
      ),
    );
  }
}
