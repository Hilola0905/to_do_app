import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';

import '../../utils/size/size_utils.dart';
import '../../utils/styles/app_text_style.dart';
import '../routes.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, RouteNames.tabBox);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return AnnotatedRegion(
        value: const  SystemUiOverlayStyle(
          statusBarColor: AppColors.transparent,
          statusBarBrightness: Brightness.dark,
        ),

        child: Scaffold(
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 30.h),
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
            child: Center(
              child: Text("Welcome To Do App" ,
                textAlign: TextAlign.center,
                style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,
                fontSize: 50,
              ),),
            ),
          ),
        ));
  }
}
