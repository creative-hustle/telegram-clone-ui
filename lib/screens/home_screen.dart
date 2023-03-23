import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram_ui/screens/call_history_screen.dart';
import 'package:telegram_ui/screens/calling_screen.dart';
import 'package:telegram_ui/screens/chat_screen.dart';
import 'package:telegram_ui/screens/settings_screen.dart';
import 'package:telegram_ui/values/app_colors.dart';
import 'package:telegram_ui/values/text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool isClickedAll = false;
  bool isClickedImp = true;
  bool isClickedUnread = false;
  bool isClickedRead = false;
  bool openOptions = false;
  bool showCalling = false;

  List imageList = [
    "https://media.istockphoto.com/id/1386479313/photo/happy-millennial-afro-american-business-woman-posing-isolated-on-white.jpg?b=1&s=612x612&w=0&k=20&c=MsKXmwf7TDRdKRn_lHohhmD5rvVvnGs9ry0xl6CrMT4=",
    "https://media.istockphoto.com/id/1300972574/photo/millennial-male-team-leader-organize-virtual-workshop-with-employees-online.jpg?b=1&s=170667a&w=0&k=20&c=96pCQon1xF3_onEkkckNg4cC9SCbshMvx0CfKl2ZiYs=",
    "https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?w=2000",
    "https://img.freepik.com/premium-photo/portrait-young-happy-woman-looks-with-toothy-smile-standing-with-positive-facial-expression-wearing-casual-yellow-t-shirt_176532-10667.jpg?w=2000",
    "https://media.istockphoto.com/id/1311634222/photo/portrait-of-successful-black-male-modern-day-student-holding-smartphone.jpg?s=612x612&w=0&k=20&c=vl2FeMtO91rpRUcq0reIfqAQPrQsf30JF-JAxU5baro=",
  ];

  List nameList = ["Theresa Webb", "Calvin Flores", "Georgia Bell", "Natasha Romanoff", "Soham Henry"];
  List timeList = ["15:20", "15:13", "15:13", "8:30", "7:20"];

  List messageList = [
    "Why did you do that?",
    "Me: Bro, just ignore that",
    "Will you stop ignoring me?",
    "Me: Yes, of course come, of course come",
    "Hi, bro! Come to my house!",
  ];
  AnimationController? animationController;

  final Widget _back = Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: AppColors.blue,
    ),
    padding: EdgeInsets.symmetric(vertical: 9.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          "assets/images/speaker.svg",
          width: 20.7.w,
          height: 22.13.w,
        ),
        SvgPicture.asset(
          "assets/images/lock.svg",
          width: 14.67.w,
          height: 22.w,
          color: AppColors.white,
        ),
        SvgPicture.asset(
          "assets/images/group.svg",
          width: 31.13.w,
          height: 22.5.w,
        ),
      ],
    ),
  );

  final Widget _front = Text(
    "Telegram",
    style: GilroyBold.copyWith(
      color: AppColors.blue,
      fontSize: 30.sp,
    ),
  );

  late Widget _card = _front;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    animationController?.addListener(() {
      if ((animationController?.value)! >= .5 && _card != _back) {
        setState(() => _card = _back);
      } else if ((animationController?.value)! < .5 && _card != _front) {
        setState(() => _card = _front);
      }
    });
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawerEnableOpenDragGesture: false,
      endDrawer: drawerView(),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 70.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 27.w, right: 15.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AnimatedBuilder(
                            animation: animationController!,
                            builder: (c, anim) => Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.0025)
                                ..rotateY((animationController?.value)! * pi),
                              alignment: FractionalOffset.center,
                              child: _card,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  if (animationController?.value == 1)
                                    animationController?.reverse(from: 1);
                                  else
                                    animationController?.forward(from: 0);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
                                  child: SvgPicture.asset(
                                    "assets/images/plus.svg",
                                    width: 23.w,
                                    height: 23.w,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showCalling = !showCalling;
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.h),
                                  child: SvgPicture.asset(
                                    "assets/images/search.svg",
                                    width: 23.w,
                                    height: 23.w,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _key.currentState!.openEndDrawer();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                                  child: SvgPicture.asset(
                                    "assets/images/menu.svg",
                                    width: 22.w,
                                    height: 19.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 27.w),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              isClickedAll = true;
                              isClickedImp = false;
                              isClickedUnread = false;
                              isClickedRead = false;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                color: isClickedAll ? AppColors.blue : AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                "All",
                                style: GilroySemiBold.copyWith(
                                  color: isClickedAll ? AppColors.white : AppColors.black,
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
                              isClickedAll = false;
                              isClickedImp = true;
                              isClickedUnread = false;
                              isClickedRead = false;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                color: isClickedImp ? AppColors.blue : AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                "Important",
                                style: GilroySemiBold.copyWith(
                                  color: isClickedImp ? AppColors.white : AppColors.black,
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
                              isClickedAll = false;
                              isClickedImp = false;
                              isClickedUnread = true;
                              isClickedRead = false;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                color: isClickedUnread ? AppColors.blue : AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                "Unread",
                                style: GilroySemiBold.copyWith(
                                  color: isClickedUnread ? AppColors.white : AppColors.black,
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
                              isClickedAll = false;
                              isClickedImp = false;
                              isClickedUnread = false;
                              isClickedRead = true;
                              setState(() {});
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                              decoration: BoxDecoration(
                                color: isClickedRead ? AppColors.blue : AppColors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Text(
                                "Read",
                                style: GilroySemiBold.copyWith(
                                  color: isClickedRead ? AppColors.white : AppColors.black,
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
                    height: 30.h,
                  ),
                  ListView.builder(
                    itemCount: imageList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(left: 27.w),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(
                                isOnline: index % 2 == 0 ? true : false,
                                username: nameList[index].toString(),
                                profilePic: imageList[index].toString(),
                              ),
                            ),
                          );
                        },
                        child: Slidable(
                          key: UniqueKey(),
                          closeOnScroll: true,
                          endActionPane: ActionPane(
                            extentRatio: 0.7.w,
                            motion: const BehindMotion(),
                            dismissible: DismissiblePane(
                              onDismissed: () {
                                print(index);
                              },
                            ),
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: AppColors.blue,
                                    height: 82.w,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/images/saved.svg",
                                        width: 16.w,
                                        height: 22.w,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 82.w,
                                    color: AppColors.blue,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/images/read.svg",
                                        width: 25.87.w,
                                        height: 12.3.w,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    color: AppColors.blue,
                                    height: 82.w,
                                    child: Center(
                                      child: SvgPicture.asset(
                                        "assets/images/bin.svg",
                                        width: 18.w,
                                        height: 22.w,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(right: 27.w, top: 14.h, bottom: 14.h),
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
                                        height: 5.h,
                                      ),
                                      Text(
                                        messageList[index],
                                        style: GilroyMedium.copyWith(
                                          color: index % 2 == 0
                                              ? index == 4
                                                  ? AppColors.grey
                                                  : AppColors.blue
                                              : AppColors.grey,
                                          fontSize: 16.sp,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 80.w,
                                  child: index == 4
                                      ? Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "Yesterday",
                                              style: GilroyMedium.copyWith(
                                                color: AppColors.grey,
                                                fontSize: 17.sp,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Text(
                                              "",
                                              style: GilroyMedium.copyWith(
                                                color: index % 2 == 0 ? AppColors.blue : AppColors.grey,
                                                fontSize: 16.sp,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        )
                                      : Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "7:20",
                                              style: GilroyMedium.copyWith(
                                                color: AppColors.grey,
                                                fontSize: 17.sp,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            index % 2 == 0
                                                ? Container(
                                                    height: 26.w,
                                                    width: 26.w,
                                                    alignment: Alignment.center,
                                                    // padding: EdgeInsets.only(top: 7.h, bottom: 7.h, left: 10.w, right: 10.w),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100.r),
                                                      color: AppColors.blue,
                                                    ),
                                                    child: Text(
                                                      "2",
                                                      style: GilroyMedium.copyWith(
                                                        color: AppColors.white,
                                                        fontSize: 15.sp,
                                                      ),
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                : SvgPicture.asset(
                                                    index == 1 ? "assets/images/unread.svg" : "assets/images/read.svg",
                                                    width: 20.w,
                                                    height: 9.w,
                                                  ),
                                          ],
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 60.h,
                  ),
                ],
              ),
            ),
            if (showCalling == true)
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 27.w),
                    child: Material(
                      elevation: 5,
                      shadowColor: AppColors.shadow,
                      borderRadius: BorderRadius.circular(30.r),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.r),
                          color: AppColors.white,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 18.w,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Container(
                                        color: AppColors.grey.withOpacity(0.2),
                                        child: Image.network(
                                          "https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?w=2000",
                                          height: 54.w,
                                          width: 54.w,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: RichText(
                                    text: TextSpan(
                                      text: "Georgia Bell ",
                                      style: GilroyBold.copyWith(
                                        color: AppColors.black,
                                        fontSize: 20.sp,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'calls you',
                                          style: GilroyMedium.copyWith(
                                            color: AppColors.black,
                                            fontSize: 18.sp,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            SizedBox(
                              height: 35.w,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const CallingScreen(
                                              profilePic:
                                                  "https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?w=2000",
                                              username: "Georgia Bell",
                                            ),
                                          ),
                                        );
                                        setState(() {
                                          showCalling = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 5.w),
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/cross.svg",
                                              width: 15.8.w,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              "Reply",
                                              style: GilroyMedium.copyWith(
                                                color: AppColors.green,
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 2.w,
                                    color: AppColors.light2,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          showCalling = false;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(vertical: 5.w),
                                        alignment: Alignment.bottomCenter,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              "assets/images/calls.svg",
                                              width: 18.w,
                                              color: AppColors.red,
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                            Text(
                                              "Decline",
                                              style: GilroyMedium.copyWith(
                                                color: AppColors.red,
                                                fontSize: 18.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18.w,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget drawerView() {
    return SafeArea(
      child: Drawer(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35.r),
            bottomLeft: Radius.circular(35.r),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.825,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 68.h, right: 32.w, left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
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
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      child: SvgPicture.asset(
                        "assets/images/settings.svg",
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 38.w, left: 38.w),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
                    },
                    child: Row(
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 7.77.w,
                            ),
                            SvgPicture.asset(
                              "assets/images/contacts.svg",
                              width: 23.w,
                              // height: 23.5.w,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            Text(
                              "Contacts",
                              style: GilroySemiBold.copyWith(
                                color: AppColors.blue,
                                fontSize: 19.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CallHistoryScreen(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 7.w,
                              ),
                              SvgPicture.asset(
                                "assets/images/calls.svg",
                                width: 26.w,
                                // height: 23.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 60.w,
                              ),
                              Text(
                                "Calls",
                                style: GilroySemiBold.copyWith(
                                  color: AppColors.blue,
                                  fontSize: 19.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 8.77.w,
                            ),
                            SvgPicture.asset(
                              "assets/images/saved.svg",
                              width: 20.w,
                              // height: 23.w,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            Text(
                              "Save messages",
                              style: GilroySemiBold.copyWith(
                                color: AppColors.blue,
                                fontSize: 19.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 2.77.w,
                            ),
                            SvgPicture.asset(
                              "assets/images/invite.svg",
                              width: 33.w,
                              // height: 23.w,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            Text(
                              "Invite Friends",
                              style: GilroySemiBold.copyWith(
                                color: AppColors.blue,
                                fontSize: 19.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 6.77.w,
                            ),
                            SvgPicture.asset(
                              "assets/images/faq.svg",
                              width: 25.w,
                              // height: 23.w,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 60.w,
                            ),
                            Text(
                              "Telegram FAQ",
                              style: GilroySemiBold.copyWith(
                                color: AppColors.blue,
                                fontSize: 19.sp,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
