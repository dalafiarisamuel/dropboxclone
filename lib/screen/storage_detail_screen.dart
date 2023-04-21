import 'package:dropboxclone/folder_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../app_styles.dart';
import '../widget/storage_breakdown.dart';

class StorageDetailScreen extends StatelessWidget {
  const StorageDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/arrow_back_icon.svg'),
                  Text(
                    'Storage details',
                    style: kQuestrialSemibold.copyWith(
                        color: kBlackColor, fontSize: 15.sp),
                  ),
                  SvgPicture.asset('assets/more_horiz_icon.svg'),
                ],
              ),
              SizedBox(height: 30.h),
              SvgPicture.asset('assets/doughnut.svg'),
              SizedBox(height: 20.h),
              Text(
                'Available',
                style: kQuestrialRegular.copyWith(
                    color: kLightBlackColor, fontSize: 16.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                '43.36 GB',
                style: kQuestrialBold.copyWith(
                    color: kBlackColor, fontSize: 20.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                'Total 128 GB',
                style: kQuestrialRegular.copyWith(
                    color: kLightBlackColor, fontSize: 16.sp),
              ),
              SizedBox(height: 40.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: fileTypes.length,
                itemBuilder: (context, index) {
                  return StorageInformation(
                    fileType: fileTypes[index],
                    fileTypeSize: fileTypesSize[index],
                    fileTypeColor: textColors[index],
                    progressRange: fileTypesProgressBar[index],
                  );
                },
              ),
              SizedBox(height: 20.h),
              Text(
                'Export details',
                style: kQuestrialMedium.copyWith(
                    color: kLightBlackColor, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
