import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_app/screens/tab/home/widgets/task_item_view.dart';
import 'package:to_do_app/utils/images/app_images.dart';

import '../../../data/local/local_database.dart';
import '../../../data/model/task_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/size_utils.dart';
import '../../../utils/styles/app_text_style.dart';
import 'dialogs/add_task_dialog.dart';
import 'dialogs/update_task_dialog.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.stream});
  final Stream? stream;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasks = [];

  _init() async {
    tasks = await LocalDatabase.getAllTasks();
    //print(tasks[0].category);
    setState(() {});
  }

  _searchQuery(String q) async {
    tasks = await LocalDatabase.searchTasks(q);
    setState(() {});
  }

  DateTime? dateTime;
  TimeOfDay? timeOfDay;

  @override
  void initState() {
   // print(tasks[0].category);
    _init();
    if (widget.stream != null) {
      widget.stream!.listen((event) {
        _init();
      });
    }
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
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.blue,
          onRefresh: () {
            _init();
            return Future<void>.delayed(const Duration(seconds: 2));
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 35.h,horizontal: 24.w),
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
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.h),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(" Home ",style: AppTextStyle.interMedium.copyWith(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),),
                     Container(
                       width: 40.w,
                       height: 40.h,
                       decoration:  const BoxDecoration(
                         color: AppColors.white,
                         shape: BoxShape.circle
                       ),
                     ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h,),
                TextField(
                  onChanged: _searchQuery,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                    color: Colors.white ,
                    width: 2,
                  ),
                ),
                    hintText: "Search",
                    hintStyle: AppTextStyle.interMedium.copyWith(
                        fontSize: 18,
                        color: Colors.grey
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
                Expanded(
                  child: tasks.isEmpty ? Center(child: Image.asset(AppImages.img6)) : ListView(
                    children:  List.generate(
                      tasks.length,
                          (index) {
                        TaskModel taskModel = tasks[index];
                        return TaskItemView(
                          onStatusUpdate: () async {
                            await LocalDatabase.updateTaskStatus(
                              newStatus: "done",
                              taskId: taskModel.id!,
                            );
                            _init();
                          },
                          taskModel: taskModel,
                          onDelete: () async {
                            int d = await LocalDatabase.deleteTask(taskModel.id!);
                            print("DELETED ID:$d");
                            _init();
                          },
                          onUpdate: () {
                            updateTaskDialog(
                              context: context,
                              task: taskModel,
                              taskModelChanged: (updatedTask) async {
                                await LocalDatabase.updateTask(
                                  updatedTask.copyWith(id: taskModel.id),
                                  taskModel.id!,
                                );
                                _init();
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addTaskDialog(
              context: context,
              taskModelChanged: (task) async {
                await LocalDatabase.insertTask(task);
                _init();
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
