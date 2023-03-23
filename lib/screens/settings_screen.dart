import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram_ui/values/app_colors.dart';
import 'package:telegram_ui/values/text_styles.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 61.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 27.w, left: 9.w),
              child: Row(
                children: [
                  RotatedBox(
                    quarterTurns: 2,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 18.w),
                        decoration: BoxDecoration(
                          // color: Colors.red,
                          borderRadius: BorderRadius.circular(100.r),
                        ),
                        child: SvgPicture.asset(
                          "assets/images/back.svg",
                          width: 10.41.w,
                          height: 18.66.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    "@wdlam",
                    style: GilroyBold.copyWith(
                      color: AppColors.blue,
                      fontSize: 25.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(right: 27.w, left: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Container(
                              color: AppColors.grey.withOpacity(0.2),
                              child: Image.network(
                                "https://static.toiimg.com/thumb/resizemode-4,width-1200,height-900,msid-71687592/71687592.jpg",
                                height: 82.w,
                                width: 82.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 18.w,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Arnold Schwarzenegger",
                                  style: GilroyBold.copyWith(
                                    color: AppColors.black,
                                    fontSize: 23.sp,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  "+375(29)9638433",
                                  style: GilroySemiBold.copyWith(
                                    color: AppColors.grey,
                                    fontSize: 17.sp,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 34.h,
                      ),
                      Text(
                        "Account",
                        style: GilroyBold.copyWith(
                          color: AppColors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        "+375(29)9638433",
                        style: GilroySemiBold.copyWith(
                          color: AppColors.black,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Tap to change phone number",
                        style: GilroySemiBold.copyWith(
                          color: AppColors.grey,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        height: 2.w,
                        color: AppColors.light2,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "@wdlam",
                        style: GilroySemiBold.copyWith(
                          color: AppColors.black,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Username",
                        style: GilroySemiBold.copyWith(
                          color: AppColors.grey,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Container(
                        height: 2.w,
                        color: AppColors.light2,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text(
                        "I’m Senior Frontend Developer from Microsoft",
                        style: GilroySemiBold.copyWith(
                          color: AppColors.black,
                          fontSize: 17.sp,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        "Bio",
                        style: GilroySemiBold.copyWith(
                          color: AppColors.grey,
                          fontSize: 17.sp,
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      Text(
                        "Settings",
                        style: GilroyBold.copyWith(
                          color: AppColors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/noti.svg",
                                width: 21.82.w,
                                height: 22.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 52.w,
                              ),
                              Text(
                                "Notification and Sounds",
                                style: GilroySemiBold.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 3.w,
                              ),
                              SvgPicture.asset(
                                "assets/images/lock.svg",
                                width: 16.w,
                                height: 24.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 52.w,
                              ),
                              Text(
                                "Privacy and Security",
                                style: GilroySemiBold.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/stats.svg",
                                width: 22.w,
                                height: 22.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 52.w,
                              ),
                              Text(
                                "Data and Storage",
                                style: GilroySemiBold.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/chat.svg",
                                width: 22.w,
                                height: 20.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 52.w,
                              ),
                              Text(
                                "Chat settings",
                                style: GilroySemiBold.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      Stack(
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/device.svg",
                                width: 22.w,
                                height: 17.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 52.w,
                              ),
                              Text(
                                "Devices",
                                style: GilroySemiBold.copyWith(
                                  color: AppColors.black,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 51.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
