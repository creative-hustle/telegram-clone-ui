import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:telegram_ui/values/app_colors.dart';
import 'package:telegram_ui/values/text_styles.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({
    Key? key,
    required this.username,
    required this.profilePic,
  }) : super(key: key);
  final String username;
  final String profilePic;

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  DateTime? _lastButtonPress;
  String? _pressDuration;
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _lastButtonPress = DateTime.now();
    _updateTimer();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) => _updateTimer());
  }

  void _updateTimer() {
    final duration = DateTime.now().difference(_lastButtonPress!);
    final newDuration = _formatDuration(duration);
    setState(() {
      _pressDuration = newDuration;
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey.withOpacity(0.2),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.profilePic),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: BoxDecoration(color: AppColors.white.withOpacity(0.0)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      color: AppColors.grey.withOpacity(0.2),
                      child: Image.network(
                        widget.profilePic,
                        height: 157.w,
                        width: 157.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 27.h,
                ),
                Text(
                  widget.username,
                  style: GilroyBold.copyWith(
                    color: AppColors.white,
                    fontSize: 23.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  _pressDuration!,
                  style: GilroyMedium.copyWith(
                    color: AppColors.white,
                    fontSize: 17.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 180.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/images/chat.svg",
                      width: 26.32.w,
                      height: 23.93.w,
                      color: AppColors.white,
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        "assets/images/endCall.svg",
                        width: 72.w,
                        height: 72.w,
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    SvgPicture.asset(
                      "assets/images/big.svg",
                      width: 36.48.w,
                      height: 24.25.w,
                      color: AppColors.white,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
