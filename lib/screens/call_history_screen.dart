import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram_ui/screens/calling_screen.dart';
import 'package:telegram_ui/values/app_colors.dart';
import 'package:telegram_ui/values/text_styles.dart';

class CallHistoryScreen extends StatefulWidget {
  const CallHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CallHistoryScreen> createState() => _CallHistoryScreenState();
}

class _CallHistoryScreenState extends State<CallHistoryScreen> {
  List imageList = [
    "https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?b=1&s=612x612&w=0&k=20&c=MsKXmwf7TDRdKRn_lHohhmD5rvVvnGs9ry0xl6CrMT4=",
    "https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?b=1&s=170667a&w=0&k=20&c=96pCQon1xF3_onEkkckNg4cC9SCbshMvx0CfKl2ZiYs=",
    "https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?w=2000",
    "https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?w=2000",
    "https://img.freepik.com/premium-photo/portrait-young-happy-woman-looks-with-toothy-smile-standing-with-positive-facial-expression-wearing-casual-yellow-t-shirt_176532-10667.jpg?w=2000",
    "https://media.istockphoto.com/id/1311634222/photo/portrait-of-successful-black-male-modern-day-student-holding-smartphone.jpg?s=612x612&w=0&k=20&c=vl2FeMtO91rpRUcq0reIfqAQPrQsf30JF-JAxU5baro=",
    "https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?b=1&s=170667a&w=0&k=20&c=96pCQon1xF3_onEkkckNg4cC9SCbshMvx0CfKl2ZiYs=",
    "https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?b=1&s=612x612&w=0&k=20&c=MsKXmwf7TDRdKRn_lHohhmD5rvVvnGs9ry0xl6CrMT4=",
    "https://media.istockphoto.com/id/1311634222/photo/portrait-of-successful-black-male-modern-day-student-holding-smartphone.jpg?s=612x612&w=0&k=20&c=vl2FeMtO91rpRUcq0reIfqAQPrQsf30JF-JAxU5baro=",
    "https://img.freepik.com/premium-photo/portrait-young-happy-woman-looks-with-toothy-smile-standing-with-positive-facial-expression-wearing-casual-yellow-t-shirt_176532-10667.jpg?w=2000",
  ];

  List nameList = [
    "Theresa Webb",
    "Calvin Flores",
    "Georgia Bell",
    "Georgia Bell",
    "Natasha Romanoff",
    "Soham Henry",
    "Calvin Flores",
    "Theresa Webb",
    "Soham Henry",
    "Natasha Romanoff",
  ];
  List timeList = [
    "18.02.2020 at 19:30",
    "18.02.2020 at 13:40",
    "18.02.2020 at 12:26",
    "17.02.2020 at 19:30",
    "17.02.2020 at 15:26",
    "16.02.2020 at 13:30",
    "15.02.2020 at 05:47",
    "14.02.2020 at 06:04",
    "13.02.2020 at 04:27",
    "12.02.2020 at 09:17"
  ];

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    "Call history",
                    style: GilroyBold.copyWith(
                      color: AppColors.blue,
                      fontSize: 22.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 10.w,
                      horizontal: 18.w,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(right: 27.w, left: 27.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        itemCount: imageList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CallingScreen(
                                    profilePic: imageList[index].toString(),
                                    username: nameList[index].toString(),
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(30.r),
                                    child: Container(
                                      color: AppColors.grey.withOpacity(0.2),
                                      child: Image.network(
                                        imageList[index],
                                        height: 82.w,
                                        width: 82.w,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          nameList[index],
                                          style: GilroyBold.copyWith(
                                            color: AppColors.black,
                                            fontSize: 23.sp,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                              index % 2 == 0 ? "assets/images/down.svg" : "assets/images/up.svg",
                                              width: 12.21.w,
                                              height: 12.21.w,
                                              color: (index == 0 || index == 4)
                                                  ? AppColors.grey
                                                  : index % 2 == 0
                                                      ? AppColors.red
                                                      : AppColors.green,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              timeList[index],
                                              style: GilroyMedium.copyWith(
                                                color: AppColors.grey,
                                                fontSize: 17.sp,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 50.h,
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
