import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/utils/images/app_images.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/size/size_utils.dart';
import '../../utils/styles/app_text_style.dart';
import '../routes.dart';
int activeIndex=0;

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    List<List> list=[
      [
        AppImages.img1,"Plan your tasks to do, that way you’ll stay organized and you won’t skip any",
      ],
      [
        AppImages.img2,
        "Make a full schedule for the whole week and stay organized and productive all days",
      ],
      [
        AppImages.img3,
        "create a team task, invite people and manage your work together"
      ],
      [
        AppImages.img4,
        "You informations are secure with us",
      ],
    ];
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(list[activeIndex][0],width: 300,height: 300,),
              Text(list[activeIndex][1] ,

                style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                         SizedBox(),
                         Row(
                           children: [
                             ...List.generate(list.length, (index) =>
                                 Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(6),
                                     color: AppColors.white,

                                   ),
                                   margin: EdgeInsets.symmetric(horizontal: 8.w),
                                   width: activeIndex==index? 29:8,
                                   height: 4,
                                 ),
                             ),
                               ],
                         ),

                         Ink(
                       child: InkWell(
                      onTap: (){
                        if(activeIndex<list.length-1){
                           activeIndex++;
                           print(activeIndex);
                           print("bosildi");
                           setState(() {
                           });
                        }
                        else{
                          Navigator.pushReplacementNamed(context, RouteNames.welcome);

                        }
                      },
                      child:  Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: const  BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                        ),
                        child: Center(

                            child: activeIndex!=3 ?SvgPicture.asset( AppImages.nextIcon):
                            Image.asset(AppImages.img5,width: 40.w,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
