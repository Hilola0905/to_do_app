import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/data/model/category/category_model.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

import '../../../../utils/size/size_utils.dart';
import '../../../routes.dart';
import '../../profile/category_screen.dart';

showCategorySelectDialog({
  required BuildContext context,
  required ValueChanged<CategoryModel> categorySelection,
  required CategoryModel category,
}) {
  CategoryModel selectedCategory = category;
  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            color: Colors.white,
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: height / 4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 12.h),
                Text("Task Priority",style: AppTextStyle.interMedium.copyWith(
                  color: AppColors.c_2A3256,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),),
                SizedBox(height: 12.h),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: [
                      ...List.generate(categories1.length, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                          color:isCategory(selectedCategory,categories1[index]) ? Colors.green : categories1[index].color,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                    selectedCategory=categories1[index];
                                      setState(() {
                                      });
                                    },
                                    child: SvgPicture.asset(categories1[index].iconPath)
                                ),
                                Text(categories1[index].name),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("CANCEL",style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.c_2A3256,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          categorySelection.call(selectedCategory);
                          Navigator.pop(context);
                        },
                        child: Text("SAVE",style: AppTextStyle.interMedium.copyWith(
                          color: AppColors.c_2A3256,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      );
    },
  );
}

bool isCategory(CategoryModel categoryModel,CategoryModel i){
    if(categoryModel.name==i.name && categoryModel.iconPath==i.iconPath && categoryModel.color==i.color){
      return true;
  }
  return false;
}
