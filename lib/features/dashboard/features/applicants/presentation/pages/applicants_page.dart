import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/constants/functions.dart';
import 'package:gleamhiring/core/widgets/loading.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/pages/applicants_details.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/providers/applicants_providers.dart';
import 'package:gleamhiring/features/dashboard/features/applicants/presentation/widgets/applicants_widgets.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ApplicantsPage extends StatefulWidget {
  const ApplicantsPage({super.key});

  @override
  State<ApplicantsPage> createState() => _ApplicantsPageState();
}

class _ApplicantsPageState extends State<ApplicantsPage> {
  @override
  void initState() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
      final applicantProvider =
          Provider.of<ApplicantsProvider>(context, listen: false);
      applicantProvider.resetpage();
      applicantProvider.getAllApplicants(context: context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<ApplicantsProvider>(
        builder: (context, applicantsProvider, child) {
        if (applicantsProvider.isLoading && applicantsProvider.page==1) {
        return Center(child: circularLoading());
        }else{
        return LazyLoadScrollView(
          onEndOfPage: () {
            if ((Appconstants.allapplicantsResponse!.applicants!.lastPage!) >= (applicantsProvider.page)) {
            if (!applicantsProvider.isLoading) {
             applicantsProvider.getAllApplicants(context: context);
            }
            }
          },
          child: ListView.builder(
          itemCount: Appconstants.allapplicantsResponse!.applicants!.data!.length+1,
          shrinkWrap: false,
          itemBuilder:(context, index) {
            if (index<Appconstants.allapplicantsResponse!.applicants!.data!.length) {
              return ApplicantsWidget(title: "${validateString(Appconstants.allapplicantsResponse!.applicants!.data![index].name.toString())} ${validateString(Appconstants.allapplicantsResponse!.applicants!.data![index].fatherName.toString())}",
           time:Appconstants.allapplicantsResponse!.applicants!.data![index].createdAt.toString()=="null"? "Applied: Not Available":"Applied ${timeAgo(Appconstants.allapplicantsResponse!.applicants!.data![index].createdAt!)}",
            location: Appconstants.allapplicantsResponse!.applicants!.data![index].city.toString()!="null"?Appconstants.allapplicantsResponse!.applicants!.data![index].city.toString():"", departement: Appconstants.allapplicantsResponse!.applicants!.data![index].job!.title.toString(),
             status: validateString(
              Appconstants.allapplicantsResponse!.applicants!.data![index].candidateStatus.toString()=="null"?"New":Appconstants.allapplicantsResponse!.applicants!.data![index].candidateStatus!.status.toString()=="null"? "New":Appconstants.allapplicantsResponse!.applicants!.data![index].candidateStatus!.status.toString()),
              rating:Appconstants.allapplicantsResponse!.applicants!.data![index].currentRating.toString()=="null"?0:Appconstants.allapplicantsResponse!.applicants!.data![index].currentRating!.status.toString()=="null"? 0:double.parse(Appconstants.allapplicantsResponse!.applicants!.data![index].currentRating!.status.toString()),
              onPress: (){
            Navigator.of(context).push(PageTransition(
            type: PageTransitionType.bottomToTop,
            child: ApplicantsDetails(
              applicantId: Appconstants.allapplicantsResponse!.applicants!.data![index].id.toString(),
              Rating: index.toString(),
              ),
            duration: const Duration(milliseconds: 500)));
          });
            } else {
              if (applicantsProvider.isLoading) {
                return Center(child: circularLoading());
              }else{
                return SizedBox();
              }
            }
              },),
        );
        }
        },
      )
    );
  }
}