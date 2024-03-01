import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/size/size_utils.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

import '../../utils/images/app_images.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? _pref;

  Future<void> _getSharedInstance() async {
    _pref = await SharedPreferences.getInstance();
    if (_pref != null) {
      _pref!.setBool("IsEnter", true);
    }
  }


  @override
  void initState() {
    _getSharedInstance();
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamed(context, RouteNames.tabBox);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    width=MediaQuery.of(context).size.width;
    height=MediaQuery.of(context).size.height;
    return AnnotatedRegion(
        value: const  SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarBrightness: Brightness.dark,
        ),
        child: Scaffold(
          body: Container(
            width: width,
            height: height,
            decoration: const  BoxDecoration(
              gradient: LinearGradient(
                  colors:  [
                    Colors.blue,
                    Colors.black,
                  ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                      const SizedBox(),
                      Image.asset(AppImages.img,width: 140.w,height: 140.h,),
                      Text("DO IT" , style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.white,
                        fontSize: 45,
                      ),),
                     Text("v 1.0.0" , style: AppTextStyle.interSemiBold.copyWith(
                        color: AppColors.white,
                        fontSize: 24,
                      ),)
              ],
            ),
          ),
        ),
    );
  }
}
