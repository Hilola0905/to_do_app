import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/size_utils.dart';
import '../../routes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 30.w),
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
           children: [
             Text("Profile",style: AppTextStyle.interSemiBold.copyWith(
               color: AppColors.white,
               fontSize: 24,
               fontWeight: FontWeight.w600,
          ),),
             SizedBox(height: 20.h,),
             Container(
               width: 110.w,
               height: 110.h,
               decoration:const  BoxDecoration(
                 color: AppColors.white,
                 shape: BoxShape.circle,
               ),
               child:  const SizedBox(),
             ),
             SizedBox(height: 20.h,),
             Row(
               children: [
                 Expanded(
                     flex: 5,
                     child: Container(
                       padding: EdgeInsets.symmetric(vertical: 12.h),
                       margin: EdgeInsets.symmetric(horizontal: 5.w),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(16.w),
                         boxShadow: const  [
                           BoxShadow(
                             color: AppColors.white,
                             spreadRadius: 1,
                             blurRadius: 4,
                             offset: Offset(2,2),
                           )
                         ],
                         border: Border.all(color: AppColors.white),
                         color: AppColors.c_2A3256.withOpacity(0.4),
                       ),
                       child: Center(
                         child: Column(
                           children: [
                             Text(" Today Active Task",style: AppTextStyle.interMedium.copyWith(
                               color: AppColors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                             ),),
                             Text("4",style: AppTextStyle.interMedium.copyWith(
                               color: AppColors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                             ),),
                           ],
                         ),
                       ),
                     ),
                 ),
                 Expanded(
                     flex: 5,
                     child:  Container(

                       padding: EdgeInsets.symmetric(vertical: 12.h),
                       margin: EdgeInsets.symmetric(horizontal: 5.w),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(16.w),
                         boxShadow: const  [
                           BoxShadow(
                             color: AppColors.white,
                             spreadRadius: 1,
                             blurRadius: 4,
                             offset: Offset(2,2),
                           )
                         ],
                         border: Border.all(color: AppColors.white),
                         color: AppColors.c_2A3256.withOpacity(0.4),
                       ),
                       child: Center(
                         child: Column(
                           children: [
                             Text(" Today Done Task",style: AppTextStyle.interMedium.copyWith(
                               color: AppColors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                             ),),
                             Text("10",style: AppTextStyle.interMedium.copyWith(
                               color: AppColors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                             ),),
                           ],
                         ),
                       ),
                     ),
                 ),
               ],
             ),
             SizedBox(height: 20.h,),
             Container(
               width: double.infinity,
               padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.h),
               margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 16.h),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16.w),
                 boxShadow: const  [
                   BoxShadow(
                     color: AppColors.white,
                     spreadRadius: 1,
                     blurRadius: 4,
                     offset: Offset(2,2),
                   )
                 ],
                 border: Border.all(color: AppColors.white),
                 color: AppColors.c_2A3256.withOpacity(0.4),
               ),
               child: Row(
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(" All Active Task",style: AppTextStyle.interMedium.copyWith(
                         color: AppColors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),),
                       Text("4",style: AppTextStyle.interMedium.copyWith(
                         color: AppColors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),),
                     ],
                   ),
                  const  Spacer(),
                   IconButton(onPressed: (){},
                       icon: const Icon(Icons.keyboard_arrow_right),
                   ),
                 ],
               ),
             ),
             Container(
               width: double.infinity,
               padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.h),
               margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 16.h),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16.w),
                 boxShadow: const  [
                   BoxShadow(
                     color: AppColors.white,
                     spreadRadius: 1,
                     blurRadius: 4,
                     offset: Offset(2,2),
                   )
                 ],
                 border: Border.all(color: AppColors.white),
                 color: AppColors.c_2A3256.withOpacity(0.4),
               ),
               child: Row(
                 children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(" All Done Task",style: AppTextStyle.interMedium.copyWith(
                         color: AppColors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),),
                       Text("4",style: AppTextStyle.interMedium.copyWith(
                         color: AppColors.white,
                         fontSize: 16,
                         fontWeight: FontWeight.w500,
                       ),),
                     ],
                   ),
                   const  Spacer(),
                   IconButton(onPressed: (){},
                     icon: const Icon(Icons.keyboard_arrow_right),
                   ),
                 ],
               ),
             ),
             Container(
               width: double.infinity,
               padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.h),
               margin: EdgeInsets.symmetric(horizontal: 5.w,vertical: 16.h),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16.w),
                 boxShadow: const  [
                   BoxShadow(
                     color: AppColors.white,
                     spreadRadius: 1,
                     blurRadius: 4,
                     offset: Offset(2,2),
                   )
                 ],
                 border: Border.all(color: AppColors.white),
                 color: AppColors.c_2A3256.withOpacity(0.4),
               ),
               child: Row(
                 children: [
                   Text("See All Category",style: AppTextStyle.interMedium.copyWith(
                     color: AppColors.white,
                     fontSize: 16,
                     fontWeight: FontWeight.w500,
                   ),),
                   const  Spacer(),
                   IconButton(onPressed: (){
                     Navigator.pushNamed(context, RouteNames.category);
                   },
                     icon: const Icon(Icons.keyboard_arrow_right),
                   ),
                 ],
               ),
             )
           ],
          ),
        ),

      ),
    );
  }
}
