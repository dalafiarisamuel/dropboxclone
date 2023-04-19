import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../app_styles.dart';

class FolderWidget extends StatelessWidget {
  final String title;
  final String date;
  final Color folderColor;
  final Color textColor;
  final String folderIcon;
  final String folderMoreIcon;

  const FolderWidget({
    Key? key,
    required this.title,
    required this.date,
    required this.folderColor,
    required this.textColor,
    required this.folderIcon,
    required this.folderMoreIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: folderColor, borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/$folderIcon",
              ),
              SvgPicture.asset(
                "assets/$folderMoreIcon",
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style:
                kQuestrialSemibold.copyWith(fontSize: 15.sp, color: textColor),
          ),
          SizedBox(height: 5.h),
          Text(
            date,
            style:
                kQuestrialRegular.copyWith(fontSize: 10.sp, color: textColor),
          )
        ],
      ),
    );
  }
}
