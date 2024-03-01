import 'package:flutter/material.dart';
import 'package:to_do_app/data/model/category/category_model.dart';
import 'package:to_do_app/screens/tab/home/dialogs/priority_select_dialog.dart';
import 'package:to_do_app/utils/colors/app_colors.dart';
import 'package:to_do_app/utils/size/size_utils.dart';
import '../../../../data/model/task_model.dart';
import '../../../../utils/styles/app_text_style.dart';
import 'category_select_dialog.dart';

updateTaskDialog({
  required BuildContext context,
  required TaskModel task,
  required ValueChanged<TaskModel> taskModelChanged,
}) {
  TaskModel taskModel = task;

  final TextEditingController titleController =
  TextEditingController(text: taskModel.title);
  final TextEditingController descriptionController =
  TextEditingController(text: taskModel.description);


  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  CategoryModel category = task.category;
  int priority = 1;
  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(16),
        topLeft: Radius.circular(16),
      ),
    ), builder: (BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h,horizontal: 14.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text("Add Task",style: AppTextStyle.interMedium.copyWith(
                    color: AppColors.c_2A3256,
                    fontSize: 24,
                    fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(height: 14.h,),
              TextField(
                maxLines: 1,
                textInputAction: TextInputAction.next,
                focusNode: focusNode1,
                onChanged: (v) {
                  taskModel = taskModel.copyWith(title: v);
                },
                controller: titleController,
                style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 18,
                    color: AppColors.white
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.c_2A3256,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white ,
                      width: 2,
                    ),
                  ),
                  hintText: "Task",
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
              SizedBox(height: 14.h,),
              TextField(
                maxLines: 4,
                textInputAction: TextInputAction.done,
                focusNode: focusNode2,
                onChanged: (v) {
                  taskModel = taskModel.copyWith(description: v);
                },
                textAlign: TextAlign.start,
                autofocus: true,
                controller: descriptionController,
                style: AppTextStyle.interSemiBold.copyWith(
                    fontSize: 18,
                    color: AppColors.white
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.c_2A3256,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 16.h),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  hintText: "Description",
                  hintStyle: AppTextStyle.interMedium.copyWith(
                    fontSize: 18,
                    color: AppColors.white,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),

                ),
              ),
              SizedBox(height: 14.h,),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Ink(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: InkWell(
                        onTap: () async {
                          dateTime = await showDatePicker(
                            cancelText: "Cancel",
                            confirmText: "Select",
                            barrierDismissible: false,
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                            currentDate: DateTime.now(),
                          );

                          if (dateTime != null) {
                            setState(() {
                              taskModel = taskModel.copyWith(deadline: dateTime);
                            });
                          }
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.c_2A3256
                          ),
                          child: Center(
                            child: Text("Date",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.white,
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
                        onTap: () async {
                          timeOfDay = await showTimePicker(
                            context: context,
                            initialEntryMode: TimePickerEntryMode.input,
                            initialTime: const TimeOfDay(hour: 8, minute: 0),
                            builder: (BuildContext context, Widget? child) {
                              return MediaQuery(
                                data: MediaQuery.of(context)
                                    .copyWith(alwaysUse24HourFormat: true),
                                child: child!,
                              );
                            },
                          );

                          if (timeOfDay != null) {
                            DateTime d = taskModel.deadline;
                            d.copyWith(
                              hour: timeOfDay!.hour,
                              minute: timeOfDay!.minute,
                            );
                            setState(() {
                              taskModel = taskModel.copyWith(deadline: d);
                            });
                          }
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.c_2A3256
                          ),
                          child: Center(
                            child: Text("Time",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.white,
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
                        onTap: () async {
                          showCategorySelectDialog(
                            context: context,
                            categorySelection: ( CategoryModel selectedCategory) {
                              setState(() {
                                category = selectedCategory ;
                              });
                              taskModel =
                                  taskModel.copyWith(category: selectedCategory);
                            }, category: category, 
                            
                          );
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.c_2A3256
                          ),
                          child: Center(
                            child: Text("Category",style: AppTextStyle.interMedium.copyWith(
                                color: AppColors.white,
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
                        onTap: (){
                                focusNode1.unfocus();
                                focusNode2.unfocus();
                              showPrioritySelectDialog(
                                    p: taskModel.priority,
                                    context: context,
                                    priority: (p)
                                {
                                  setState(() {
                                    priority = p;
                                  });
                                  taskModel = taskModel.copyWith(priority: p);
                                },
                              );
                        },
                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 12.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors.c_2A3256
                          ),
                          child: Center(
                            child: Text("Priority",style: AppTextStyle.interMedium.copyWith(
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
              SizedBox(height: 14.h,),
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
                          padding:  EdgeInsets.symmetric(vertical: 12.h),
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

                        borderRadius: BorderRadius.circular(14),
                        child: Container(
                          padding:  EdgeInsets.symmetric(vertical: 12.h),
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
      );
    }
    );
  },
  );
}
