import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gleamhiring/core/constants/app_paths.dart';
import 'package:gleamhiring/core/themes/colors.dart';
import 'package:gleamhiring/core/widgets/loading.dart';

Widget commonCacheImage({required String imagepath,required double height,required double width}) {
  return CachedNetworkImage(
      imageUrl: "https://${Appconstants.domain}.gleamhrm.com/"+imagepath,
      imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider,fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.hintTextColor,
            ),
            height: height,
            width: width,
          ),
      placeholder: (context, url) => circularLoading(),
      errorWidget: (context, url, error) {
        print("image loading error"+ error.toString());
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.hintTextColor,
          ),
          height: height,
          width: width,
        );
      });
}
