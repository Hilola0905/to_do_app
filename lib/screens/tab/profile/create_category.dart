import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/data/model/category/category_model.dart';
import 'package:to_do_app/data/model/global_list/category_colors.dart';
import 'package:to_do_app/data/model/global_list/category_icons.dart';
import 'package:to_do_app/utils/styles/app_text_style.dart';

import '../../../data/local/local_database.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/size_utils.dart';
int actIndex=0;
int actIndex1=0;
class CreateCategory extends StatefulWidget {
  const CreateCategory({super.key,});
 // final ValueChanged<CategoryModel> categoryChanged;

  @override
  State<CreateCategory> createState() => _CreateCategoryState();
}
      Future<void> categoryChanged (category) async {
                   await LocalDatabase.insertTask(category);
            //   _init();
              }

class _CreateCategoryState extends State<CreateCategory> {
  CategoryModel categoryModel=CategoryModel.initialValue;
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
        resizeToAvoidBottomInset: false,
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
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Category",
                textAlign: TextAlign.center,
                style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 32,
              ),),
              SizedBox(height: 24.h,),
              Text("Category name", style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
              SizedBox(height: 24.h,),
              TextField(
                maxLines: 1,
                textInputAction: TextInputAction.next,
                onChanged: (v) {
                  categoryModel = categoryModel!.copyWith(name: v);
                },
              //  controller: titleController,
                style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 18,
                    color: AppColors.white
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueAccent,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white ,
                      width: 2,
                    ),
                  ),
                  hintText: "Enter Category",
                  hintStyle: AppTextStyle.interMedium.copyWith(
                      fontSize: 18,
                      color: AppColors.white
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 24.h,),
              Text("Category icon ", style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
              SizedBox(height: 24.h,),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(icons.length, (index) =>
                   InkWell(
                     onTap: (){
                       setState(() {
                         actIndex1=index;
                       });
                       print("active : $actIndex1  index : $index}");
                       categoryModel = categoryModel!.copyWith(iconPath: icons[index]);
                     },
                     child:  Container(
                       width: 50.w,
                       height: 50.h,
                       decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         color: index==actIndex1 ? Colors.green : AppColors.white ,
                       ),
                       margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                       child: SvgPicture.asset(icons[index],height: 5.h,width: 5.w,),
                     ),
                   ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h,),
              Text("Category color ", style: AppTextStyle.interSemiBold.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),),
              SizedBox(height: 24.h,),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(colors.length, (index) =>
                        InkWell(
                          onTap: (){
                            setState(() {
                              actIndex = index;
                            });
                            print("active : $actIndex  index : $index}");

                            categoryModel = categoryModel!.copyWith(color: colors[index]);

                          },
                          child:  Container(
                            width: 50.w,
                            height: 50.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: colors[index],
                            ),
                            margin: EdgeInsets.symmetric(vertical: 5.h,horizontal: 5.w),
                            child: actIndex == index ? const Icon(Icons.check) : null,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              //const Spacer(),
              SizedBox(height: 240.h,),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.white
                          ),
                          child: Center(
                            child: Text("Cancel",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.c_2A3256,
                                fontSize: 16,
                                fontWeight: FontWeight.normal
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const  Expanded(
                      flex: 1,
                      child: SizedBox()
                  ),
                  Expanded(
                    flex: 5,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (categoryModel!.canAddCategoryToDatabase()) {
                            print("SUCCESS");
                            //showSuccessMessage("SUCCESS");
                            categoryChanged.call(categoryModel);
                            print(categoryModel.color);
                            print(categoryModel.iconPath);
                            print(categoryModel.name);
                            Navigator.pop(context);
                          } else {
                            print("Error");
                           // showErrorMessage("ERROR");
                          }
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text("create",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal
                            ),),
                          ),
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
