import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/data/model/category/category_model.dart';
import 'package:to_do_app/utils/images/app_images.dart';

import '../../../data/local/local_database.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/size/size_utils.dart';
import '../../routes.dart';

List<CategoryModel> categories1=[
    CategoryModel(
        iconPath: AppImages.icon1,
        name: "Grocery",
        color: Colors.cyan,
    ),
  CategoryModel(
        iconPath: AppImages.icon2,
        name: "Movie",
        color: Colors.lightBlueAccent,
    ),
  CategoryModel(
        iconPath: AppImages.icon3,
        name: "Health",
        color: Colors.lightBlueAccent,
    ),
  CategoryModel(
        iconPath: AppImages.icon4,
        name: "Music",
        color: Colors.purpleAccent,
    ),
  CategoryModel(
        iconPath: AppImages.icon5,
        name: "Social",
        color: Colors.pinkAccent,
    ),
  CategoryModel(
        iconPath: AppImages.icon6,
        name: "University",
        color: Colors.lightBlue,
    ),
  CategoryModel(
        iconPath: AppImages.icon7,
        name: "Design",
        color: Colors.blueGrey,
    ),
  CategoryModel(
        iconPath: AppImages.icon9,
        name: "Work",
        color: Colors.brown,
    ),CategoryModel(
        iconPath: AppImages.icon8,
        name: "Sport",
        color: Colors.orangeAccent,
    ),CategoryModel(
        iconPath: AppImages.icon10,
        name: "Home",
        color: Colors.yellow,
    ),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int activeCategory=0;
  CategoryModel categoryModel = CategoryModel.initialValue;

  List<CategoryModel> categories = [];

  _init() async {
    categories = await LocalDatabase.getAllCategory();
    setState(() {});
  }

 @override
 void initState() {
    _init();
    for(CategoryModel i in categories){
      categories1.add(i);
    }
    // TODO: implement initState
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
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 24.w),
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
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: [
                    ...List.generate(categories1.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                        color: activeCategory == index? Colors.green : categories1[index].color,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: () {
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
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
                      color: Colors.green ,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, RouteNames.categoryCreate);
                                },
                                child:  Icon(Icons.add,weight: 50.w,)
                            ),
                            const Text("Add Category"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Ink(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.categoryCreate);
                  },
                  child:Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
                    padding: EdgeInsets.symmetric(vertical: 20.h,horizontal: 10.w),
                    color: Colors.green ,
                    child: const  Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Add Category"),
                        ],
                      ),
                    ),
                  )
                  ,
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}
