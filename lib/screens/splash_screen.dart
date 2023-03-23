import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telegram_ui/screens/home_screen.dart';
import 'package:telegram_ui/values/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Offset>? _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<Offset>(
      begin: const Offset(-0.5, 0.5),
      end: const Offset(0.5, -0.5),
    ).animate(CurvedAnimation(
      parent: _controller!,
      curve: Curves.easeInCubic,
    ));
    navigation();
  }

  navigation() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      _controller!.forward();
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      });
    });
    // await
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: SlideTransition(
          position: _animation!,
          child: Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(100.r),
            ),
            child: Center(
              child: SvgPicture.asset(
                "assets/images/send.svg",
                color: AppColors.white,
                width: 50.w,
                height: 50.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
