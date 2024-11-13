import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/pages/openingspeople_details.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/providers/opening_details_provider.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/widgets/openingdetails_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OpeningDetails extends StatefulWidget {
  String title;
  int jobId,index;
  OpeningDetails({required this.title,required this.jobId,required this.index, super.key});

  @override
  State<OpeningDetails> createState() => _OpeningDetailsState();
}

class _OpeningDetailsState extends State<OpeningDetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final openingDetailsProvider =
          Provider.of<OpeningDetailsProvider>(context, listen: false);
      openingDetailsProvider.getOpeningDetails(
          context: context, jobId: widget.jobId.toString());
    });
    super.initState();
  }

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
        //leadingWidth: 0,
        leading: GestureDetector(
            onTap: () {
              Navigator.maybePop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: AppColors.whiteColor,
            )),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        // actions: [Icon(Icons.share_outlined,color: AppColors.whiteColor,),20.sw],
        title: SizedBox(
          width: width(context) * .7,
          child: CommonTextPoppins(
              text: widget.title,
              textOverflow: TextOverflow.ellipsis,
              fontweight: FontWeight.w500,
              fontsize: 18.0,
              color: AppColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(child: Consumer<OpeningDetailsProvider>(
        builder: (context, openingDetailsProviders, child) {
        if (openingDetailsProviders.isLoading) {
        return Center(heightFactor: 2, child: circularLoading());
        }else{
        if (Appconstants.allJobApplicantsResponse!.applicants!.isEmpty) {
          return Center(child: CommonTextPoppins(text: "No applicants for this job", fontweight: FontWeight.w500, fontsize: 18, color: AppColors.primaryColor),);
        }
        else{return ListView.builder(
        itemCount: Appconstants.allJobApplicantsResponse!.applicants!.length,
        shrinkWrap: true,
        physics:const NeverScrollableScrollPhysics(),
        itemBuilder:(context, index) {
        return OpeningDetailsWidget(title: "${validateString(Appconstants.allJobApplicantsResponse!.applicants![index].name.toString())} ${validateString(Appconstants.allJobApplicantsResponse!.applicants![index].fatherName.toString())}", time: validateString(Appconstants.allJobApplicantsResponse!.applicants![index].job!.title.toString()), location: validateString(Appconstants.allJobApplicantsResponse!.applicants![index].city.toString()), timeago: Appconstants.allJobApplicantsResponse!.applicants![index].job!.createdAt==null? "Applied: Not Available":validateString("Applied ${timeAgo(Appconstants.allJobApplicantsResponse!.applicants![index].job!.createdAt!)}"), onPress: (){
          Navigator.of(context).push(PageTransition(
          type: PageTransitionType.bottomToTop,
          child: OpeningPeopleDetails(openingPeopleDetails: Appconstants.allJobApplicantsResponse!.applicants![index],index: widget.index,),
          duration: const Duration(milliseconds: 500)));
        });
      },);}
        }
        },
      )),
    );
  }
}
