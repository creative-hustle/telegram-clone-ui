import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram_ui/screens/calling_screen.dart';
import 'package:telegram_ui/screens/other_profile_screen.dart';
import 'package:telegram_ui/values/app_colors.dart';
import 'package:telegram_ui/values/text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.username,
    required this.profilePic,
    required this.isOnline,
  }) : super(key: key);

  final String username;
  final String profilePic;
  final bool isOnline;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showOptions = false;
  bool showMedia = false;
  FocusNode focusNode = FocusNode();

  List messagesList = [
    "Oh! Cool Send me photo",
    "Ok",
    "I went to the zoo today to feed the crocodiles",
    "Show me, pls!",
    "Will we arrive tomorrow?",
    "Why did you do that?",
    "Will you stop ignoring me?",
    "Ok. Good bay!",
    "Hi, Come to my house!"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: InkWell(
          onTap: () {
            setState(() {
              showOptions = false;
              showMedia = false;
            });
          },
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 57.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 9.w, right: 18.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                          width: 10.w,
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OtherProfileScreen(
                                    isOnline: widget.isOnline,
                                    username: widget.username,
                                    profilePic: widget.profilePic,
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30.r),
                                  child: Container(
                                    color: AppColors.grey.withOpacity(0.2),
                                    child: Image.network(
                                      widget.profilePic,
                                      height: 64.w,
                                      width: 64.w,
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
                                        widget.username,
                                        style: GilroyBold.copyWith(
                                          color: AppColors.black,
                                          fontSize: 23.sp,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Text(
                                        widget.isOnline ? "Online" : "Offline",
                                        style: GilroyMedium.copyWith(
                                          color: widget.isOnline ? AppColors.blue : AppColors.grey,
                                          fontSize: 16.sp,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showOptions = !showOptions;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(100.r),
                            ),
                            child: SvgPicture.asset(
                              "assets/images/more.svg",
                              width: 20.w,
                              height: 19.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      reverse: true,
                      physics: const BouncingScrollPhysics(),
                      child: ListView.builder(
                        itemCount: messagesList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Align(
                                alignment: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 26.w, right: 20.w, top: 10.h, bottom: 10.h),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.7.w,
                                    decoration: BoxDecoration(
                                      color: index % 2 == 0 ? AppColors.blue : AppColors.light2,
                                      borderRadius: index % 2 == 0
                                          ? BorderRadius.only(
                                              bottomLeft: Radius.circular(10.r),
                                              topLeft: Radius.circular(35.r),
                                              bottomRight: Radius.circular(35.r),
                                              topRight: Radius.circular(35.r),
                                            )
                                          : BorderRadius.only(
                                              bottomLeft: Radius.circular(35.r),
                                              topLeft: Radius.circular(35.r),
                                              bottomRight: Radius.circular(35.r),
                                              topRight: Radius.circular(10.r),
                                            ),
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 25.h),
                                    child: Text(
                                      messagesList[index],
                                      style: GilroyMedium.copyWith(
                                        color: index % 2 == 0 ? AppColors.white : AppColors.black,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              if (index == 1)
                                Align(
                                  alignment: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 26.w, right: 20.w, top: 10.h, bottom: 10.h),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.7.w,
                                      height: 210.h,
                                      decoration: BoxDecoration(
                                        color: AppColors.grey.withOpacity(0.2),
                                        borderRadius: index % 2 == 0
                                            ? BorderRadius.only(
                                                bottomLeft: Radius.circular(10.r),
                                                topLeft: Radius.circular(35.r),
                                                bottomRight: Radius.circular(35.r),
                                                topRight: Radius.circular(35.r),
                                              )
                                            : BorderRadius.only(
                                                bottomLeft: Radius.circular(35.r),
                                                topLeft: Radius.circular(35.r),
                                                bottomRight: Radius.circular(35.r),
                                                topRight: Radius.circular(10.r),
                                              ),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: index % 2 == 0
                                            ? BorderRadius.only(
                                                bottomLeft: Radius.circular(10.r),
                                                topLeft: Radius.circular(35.r),
                                                bottomRight: Radius.circular(35.r),
                                                topRight: Radius.circular(35.r),
                                              )
                                            : BorderRadius.only(
                                                bottomLeft: Radius.circular(35.r),
                                                topLeft: Radius.circular(35.r),
                                                bottomRight: Radius.circular(35.r),
                                                topRight: Radius.circular(10.r),
                                              ),
                                        child: Image.network(
                                          "https://wallpaperaccess.com/full/16524.jpg",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              if (index == 4)
                                Align(
                                  alignment: index % 2 == 0 ? Alignment.topLeft : Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 26.w, right: 20.w, top: 10.h, bottom: 10.h),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          width: 182.w,
                                          height: 182.w,
                                          child: const CircularProgressIndicator(
                                            value: 0.6,
                                            valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                                            backgroundColor: AppColors.light2,
                                          ),
                                        ),
                                        Container(
                                          width: 178.w,
                                          height: 178.w,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.grey.withOpacity(0.2),
                                            shape: BoxShape.circle,
                                            image: const DecorationImage(
                                              image: NetworkImage(
                                                "https://a-z-animals.com/media/2022/06/Cornered-crocodile-fight-five-adult-lions-header.jpg",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (index == messagesList.length - 1)
                                SizedBox(
                                  height: 160.w,
                                ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              if (showOptions == true)
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 28.w, top: 57.h),
                    child: Container(
                      height: 270.h,
                      width: MediaQuery.of(context).size.width * 0.65,
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35.r),
                          topLeft: Radius.circular(35.r),
                          bottomRight: Radius.circular(35.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                      padding: EdgeInsets.only(right: 5.w, left: 26.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => CallingScreen(
                                    profilePic: widget.profilePic,
                                    username: widget.username,
                                  ),
                                ),
                              );
                              setState(() {
                                showOptions = false;
                                showMedia = false;
                              });
                            },
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/images/calls.svg",
                                      width: 26.w,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 40.w,
                                    ),
                                    Text(
                                      "Call",
                                      style: GilroySemiBold.copyWith(
                                        color: AppColors.white,
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
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/bin.svg",
                                    width: 21.27.w,
                                    height: 25.w,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Text(
                                    "Delete chat history",
                                    style: GilroySemiBold.copyWith(
                                      color: AppColors.white,
                                      fontSize: 17.sp,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/noti.svg",
                                    width: 22.62.w,
                                    height: 22.71.w,
                                    color: AppColors.white,
                                    // height: 23.w,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Text(
                                    "Mute notification",
                                    style: GilroySemiBold.copyWith(
                                      color: AppColors.white,
                                      fontSize: 17.sp,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/search.svg",
                                    width: 21.6.w,
                                    height: 22.31.w,
                                    color: AppColors.white,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 40.w,
                                  ),
                                  Text(
                                    "Search",
                                    style: GilroySemiBold.copyWith(
                                      color: AppColors.white,
                                      fontSize: 17.sp,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.bottomCenter,
                child: customTextField(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: showAllMedia(),
    );
  }

  Widget customTextField() {
    return Container(
      width: double.infinity,
      height: 129.w,
      color: AppColors.white,
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: Center(
        child: InkWell(
          onTap: () {
            setState(() {
              showOptions = false;
              showMedia = false;
            });
            focusNode.requestFocus();
          },
          child: Container(
            height: 75.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColors.light1,
            ),
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: "Type your message...",
                      hintStyle: GilroyMedium.copyWith(
                        color: AppColors.grey,
                        fontSize: 17.sp,
                      ),
                    ),
                    style: GilroyMedium.copyWith(
                      color: AppColors.grey,
                      fontSize: 17.sp,
                    ),
                    maxLines: null,
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: AppColors.blue,
                    focusNode: focusNode,
                    onTap: () {
                      setState(() {
                        showOptions = false;
                        showMedia = false;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            showMedia = !showMedia;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: SvgPicture.asset(
                            "assets/images/plus.svg",
                            width: 23.w,
                            height: 23.w,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: SvgPicture.asset(
                          "assets/images/sticker.svg",
                          width: 22.56.w,
                          height: 22.5.w,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: SvgPicture.asset(
                          "assets/images/video.svg",
                          width: 20.w,
                          height: 20.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAllMedia() {
    if (showMedia == true) {
      return Container(
        width: double.infinity,
        height: 129.w,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: InkWell(
          onTap: () {
            setState(() {
              showOptions = false;
              showMedia = false;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/more.svg",
                    width: 23.42.w,
                    height: 23.42.w,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    "Image",
                    style: GilroySemiBold.copyWith(
                      color: AppColors.blue,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/doc.svg",
                    width: 23.42.w,
                    height: 23.42.w,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    "Documents",
                    style: GilroySemiBold.copyWith(
                      color: AppColors.blue,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/contacts.svg",
                    width: 23.52.w,
                    height: 24.03.w,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    "Contacts",
                    style: GilroySemiBold.copyWith(
                      color: AppColors.blue,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/images/contacts.svg",
                    width: 17.26.w,
                    height: 25.88.w,
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  Text(
                    "Location",
                    style: GilroySemiBold.copyWith(
                      color: AppColors.blue,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
}
