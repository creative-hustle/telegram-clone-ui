import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram_ui/values/app_colors.dart';
import 'package:telegram_ui/values/text_styles.dart';

class OtherProfileScreen extends StatefulWidget {
  const OtherProfileScreen({
    Key? key,
    required this.username,
    required this.profilePic,
    required this.isOnline,
  }) : super(key: key);
  final String username;
  final String profilePic;
  final bool isOnline;

  @override
  State<OtherProfileScreen> createState() => _OtherProfileScreenState();
}

class _OtherProfileScreenState extends State<OtherProfileScreen> {
  bool isClickedLoc = false;
  bool isClickedImage = true;
  bool isClickedDocs = false;

  List imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7ZJ1Jgihoh2vKl6eeb1EVv8S_fgiCqn2n9g&usqp=CAU",
    "https://th-thumbnailer.cdn-si-edu.com/Nq9G07BNBmd9PU_be-mxDU1hzOk=/fit-in/1600x0/filters:focal(2362x1597:2363x1598)/https://tf-cmsv2-smithsonianmag-media.s3.amazonaws.com/filer_public/18/f4/18f4e941-b85b-45ae-b07c-52eaa6ca1f84/gettyimages-1237093074.jpg",
    "https://images.unsplash.com/photo-1566008885218-90abf9200ddb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y29vbCUyMGNhcnxlbnwwfHwwfHw%3D&w=1000&q=80",
    "https://wallpaperaccess.com/full/195083.jpg",
    "https://www.popsci.com/uploads/2022/07/29/Mark-Elias-Photo_How_To_Shoot_Cars_Story-007-scaled-1.webp",
    "https://writestylesonline.com/wp-content/uploads/2020/01/Three-Things-To-Consider-When-Deciding-On-Your-LinkedIn-Profile-Picture-1024x1024.jpg",
    "http://cdn.shopify.com/s/files/1/2729/8232/articles/Create_Photos_for_Article_1920x1080_6.jpg?v=1567779872",
    "https://i.insider.com/52c9702c6bb3f751704f26dd?width=743&format=jpeg",
    "https://wallpapers-hub.art/wallpaper-images/249714.jpg",
    "https://media.architecturaldigest.com/photos/60426252993888ff3d26b159/master/pass/20-1223%20Voyager%20Station.jpg",
    "https://qph.cf2.quoracdn.net/main-qimg-ccee24ed7a210fcfdd5c56e0c77b651f-pjlq",
    "https://c4.wallpaperflare.com/wallpaper/919/724/989/cars-1920x1200-cool-pictures-wallpaper-preview.jpg",
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
              padding: EdgeInsets.only(right: 27.w, left: 27.w),
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
                    "@mmldolg",
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
              height: 34.h,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 27.w, left: 27.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.r),
                                child: Container(
                                  color: AppColors.grey.withOpacity(0.2),
                                  child: Image.network(
                                    widget.profilePic,
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
                                      widget.username,
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
                                      widget.isOnline ? "Online" : "Offline",
                                      style: GilroySemiBold.copyWith(
                                        color: AppColors.black,
                                        fontSize: 17.sp,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/images/chat.svg",
                                width: 22.w,
                                height: 20.w,
                                color: AppColors.blue,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                          Text(
                            "Phone number",
                            style: GilroyBold.copyWith(
                              color: AppColors.black,
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Text(
                            "+375(29)9239003",
                            style: GilroySemiBold.copyWith(
                              color: AppColors.black,
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          Container(
                            height: 2.w,
                            color: AppColors.light2,
                          ),
                          SizedBox(
                            height: 34.h,
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                isClickedLoc = true;
                                isClickedImage = false;
                                isClickedDocs = false;
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: isClickedLoc ? AppColors.blue : AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  "Location",
                                  style: GilroySemiBold.copyWith(
                                    color: isClickedLoc ? AppColors.white : AppColors.black,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            InkWell(
                              onTap: () {
                                isClickedLoc = false;
                                isClickedImage = true;
                                isClickedDocs = false;
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: isClickedImage ? AppColors.blue : AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  "Image",
                                  style: GilroySemiBold.copyWith(
                                    color: isClickedImage ? AppColors.white : AppColors.black,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            InkWell(
                              onTap: () {
                                isClickedLoc = false;
                                isClickedImage = false;
                                isClickedDocs = true;
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  color: isClickedDocs ? AppColors.blue : AppColors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                child: Text(
                                  "Documents",
                                  style: GilroySemiBold.copyWith(
                                    color: isClickedDocs ? AppColors.white : AppColors.black,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 27.w, left: 27.w),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4.w,
                          mainAxisSpacing: 4.w,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 12,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.r),
                              child: Image.network(
                                imageList[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 70.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
