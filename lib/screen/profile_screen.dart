import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../app_styles.dart';
import '../folder_colors.dart';
import '../widget/folder_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/arrow_back_icon.svg'),
                  Text(
                    'My Profile',
                    style: kQuestrialSemibold.copyWith(
                        color: kBlackColor, fontSize: 15.sp),
                  ),
                  SvgPicture.asset('assets/more_horiz_icon.svg'),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                width: ScreenUtil().screenWidth,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        spreadRadius: 0,
                        offset: const Offset(0, 18),
                        blurRadius: 18.r,
                        color: kBlueColor.withOpacity(0.06))
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: 19.h, horizontal: 10.w),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SvgPicture.asset('assets/pro_label.svg'),
                      ),
                      Container(
                        transform: Matrix4.translationValues(0, -18, 0),
                        child: CircleAvatar(
                          radius: 40.r,
                          backgroundColor: kLightBlueColor,
                          backgroundImage: const NetworkImage(
                            'https://media.licdn.com/dms/image/C4D03AQG4JdF1P-Kffg/profile-displayphoto-shrink_800_800'
                            '/0/1659266026070?e=2147483647&v=beta&t=UHLyBOQB05j6QTZfD2aGZyZ3fMm4PWV_yaQqImjhngM',
                          ),
                        ),
                      ),
                      Text(
                        'Samuel Dalafiari',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kQuestrialBold.copyWith(
                            color: kBlackColor, fontSize: 23.sp),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Android Engineer',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kQuestrialRegular.copyWith(
                            color: kLightBlackColor, fontSize: 15.sp),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Congue bibendum pellentesque mauris, nibh senectus .',
                        textAlign: TextAlign.center,
                        style: kQuestrialRegular.copyWith(
                            color: kLightBlackColor, fontSize: 12.sp),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My folders',
                    style: kQuestrialSemibold.copyWith(
                        color: kBlackColor, fontSize: 15.sp),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        child: SvgPicture.asset('assets/add_icon.svg'),
                        onTap: () {
                          debugPrint("User has tapped on add icon button");
                        },
                      ),
                      SizedBox(width: 15.w),
                      SvgPicture.asset('assets/setting_icon.svg'),
                      SizedBox(width: 15.w),
                      SvgPicture.asset('assets/arrow_right_icon.svg'),
                    ],
                  )
                ],
              ),
              SizedBox(height: 10.h),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7.w,
                  mainAxisSpacing: 7.h,
                  mainAxisExtent: 100.h,
                ),
                itemCount: folderNames.take(4).length,
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
              ),
              SizedBox(height: 28.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent uploads',
                    style: kQuestrialSemibold.copyWith(
                        color: kBlackColor, fontSize: 15.sp),
                  ),
                  SvgPicture.asset(
                    'assets/arrange_vertical_icon.svg',
                    width: 15.w,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20.r,
                              backgroundColor: kLightBlueColor,
                              child: SvgPicture.asset(
                                'assets/word_icon.svg',
                                width: 20.w,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Project ${index + 1}.docx',
                                  style: kQuestrialSemibold.copyWith(
                                      color: kBlackColor, fontSize: 12.sp),
                                ),
                                SizedBox(height: 5.w),
                                Text(
                                  'November 22 , 2020',
                                  style: kQuestrialRegular.copyWith(
                                      color: kLightBlackColor, fontSize: 10.sp),
                                ),
                              ],
                            )
                          ],
                        ),
                        Text(
                          '300kb',
                          style: kQuestrialRegular.copyWith(
                              color: kLightBlackColor, fontSize: 10.sp),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
