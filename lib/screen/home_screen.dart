import 'package:dropboxclone/widget/folder_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_styles.dart';
import '../folder_colors.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Your dribbox',
                    style: kQuestrialSemibold.copyWith(
                        color: kBlackColor, fontSize: 20.sp),
                  ),
                  SvgPicture.asset('assets/menu_icon.svg')
                ],
              ),
              SizedBox(height: 28.h),
              TextField(
                onChanged: (String value) {
                  if (kDebugMode) {
                    print("this is the text entered: $value");
                  }
                },
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: kGreyColor,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: kGreyColor,
                    ),
                  ),
                  prefixIcon: Container(
                    width: 24.w,
                    height: 24.h,
                    alignment: Alignment.center,
                    child: SvgPicture.asset('assets/search_icon.svg'),
                  ),
                  hintText: 'Search folder',
                  hintStyle: kQuestrialMedium.copyWith(
                    fontSize: 16.sp,
                    color: kDarkGreyColor,
                  ),
                ),
                style: kQuestrialMedium.copyWith(
                  fontSize: 16.sp,
                  color: kDarkGreyColor,
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Recent',
                        style: kQuestrialSemibold.copyWith(
                            color: kLightBlackColor, fontSize: 16.sp),
                      ),
                      SizedBox(width: 5.w),
                      SvgPicture.asset('assets/arrow_down_icon.svg')
                    ],
                  ),
                  SvgPicture.asset('assets/sort_icon.svg')
                ],
              ),
              SizedBox(height: 20.h),
              GridView.builder(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7.w,
                  mainAxisSpacing: 7.h,
                  mainAxisExtent: 100.h,
                ),
                itemCount: folderNames.length,
                itemBuilder: (context, index) {
                  final title = folderNames[index];
                  final date = folderDates[index];
                  final folderIcon = folderColoredIcon[index];
                  final moreIcon = moreColoredIcon[index];
                  final textColor = textColors[index];
                  final folderColor = folderColors[index];

                  return FolderWidget(
                    title: title,
                    date: date,
                    folderColor: folderColor,
                    textColor: textColor,
                    folderIcon: folderIcon,
                    folderMoreIcon: moreIcon,
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: kPurpleColor,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}