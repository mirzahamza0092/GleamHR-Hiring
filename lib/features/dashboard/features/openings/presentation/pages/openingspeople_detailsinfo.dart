import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/strings.dart';
import 'package:gleamhiring/core/extensions/app_extensions.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/gradientwidgets.dart';
import 'package:gleamhiring/core/widgets/text.dart';
import 'package:gleamhiring/features/dashboard/features/openings/data/datamodels/jobapplicants_model.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/widgets/openinginfo_header.dart';
import 'package:gleamhiring/features/dashboard/features/openings/presentation/widgets/openinginfo_jobinformation.dart';

class OpeningsPeoplesDetailsInfo extends StatelessWidget {
  Applicant openingPeopleDetails;
  int index;
  OpeningsPeoplesDetailsInfo(
      {required this.openingPeopleDetails, required this.index, super.key});

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
        actions: [
          // Icon(
          //   Icons.share_outlined,
          //   color: AppColors.whiteColor,
          // ),
          // 20.sw
        ],
        title: SizedBox(
          width: width(context) * .7,
          child: CommonTextPoppins(
              text: Appconstants.alljobsResponse!.data!.data![index].title
                  .toString(), //openingPeopleDetails.job!.title.toString(),
              textOverflow: TextOverflow.ellipsis,
              fontweight: FontWeight.w500,
              fontsize: 18.0,
              color: AppColors.whiteColor),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OpeninginfoHeader(
              title: Appconstants.alljobsResponse!.data!.data![index].title
                  .toString(), //openingPeopleDetails.job!.title.toString(),
              location: Appconstants
                      .alljobsResponse!.data!.data![index].locations!.name
                      .toString() +
                  Appconstants.alljobsResponse!.data!.data![index].locations!.city
                      .toString() +
                  Appconstants.alljobsResponse!.data!.data![index].locations!.state
                      .toString() +
                  Appconstants.alljobsResponse!.data!.data![index].locations!.country
                      .toString(),
              status: openingPeopleDetails.job!.status.toString(),
              timeago: formatter.format(openingPeopleDetails.job!.createdAt!),
            ),
            10.sh,
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: CommonTextPoppins(
                  text: "JOB INFORMATION",
                  fontweight: FontWeight.w600,
                  fontsize: 12,
                  color: AppColors.hintTextColor),
            ),
            10.sh,
            openingInfoJobInformation(
                description: openingPeopleDetails.job!.description.toString(),
                context: context),
            10.sh,
            // Padding(
            //   padding: const EdgeInsets.only(left: 3.0),
            //   child: CommonTextPoppins(
            //       text: "HIRING LEAD",
            //       fontweight: FontWeight.w600,
            //       fontsize: 12,
            //       color: AppColors.hintTextColor),
            // ),
            // 10.sh,
            // openingInfoHiringMan(
            //     imagepath: "",
            //     name: "Shaheer Altaf",
            //     designation: "Lead Web Designer",
            //     context: context),
            // 10.sh,
            // Padding(
            //   padding: const EdgeInsets.only(left: 3.0),
            //   child: CommonTextPoppins(
            //       text: "COLLABORATORS",
            //       fontweight: FontWeight.w600,
            //       fontsize: 12,
            //       color: AppColors.hintTextColor),
            // ),
            // 10.sh,
            // openingInfoHiringMan(
            //     imagepath: "",
            //     name: "Hamail Babar",
            //     designation: "Lead UI Designer",
            //     context: context),
          ],
        ),
      ),
    );
  }
}
