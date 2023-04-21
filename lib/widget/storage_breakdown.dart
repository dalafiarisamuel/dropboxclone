import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_styles.dart';

class StorageInformation extends StatelessWidget {
  final String fileType;
  final String fileTypeSize;
  final Color fileTypeColor;
  final double progressRange;

  const StorageInformation({
    Key? key,
    required this.fileType,
    required this.fileTypeSize,
    required this.fileTypeColor,
    required this.progressRange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 0,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: fileTypeColor,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileType,
                      style: kQuestrialSemibold.copyWith(
                          color: kMediumBlackColor, fontSize: 15.sp),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      fileTypeSize,
                      style: kQuestrialRegular.copyWith(
                          color: kMediumBlackColor, fontSize: 12.sp),
                    )
                  ],
                ),
              ),
              Expanded(
                child: LinearProgressIndicator(
                  minHeight: 1.5.h,
                  value: progressRange,
                  backgroundColor: fileTypeColor,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(kLightGreyColor),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
