import 'package:flutter/material.dart';
import 'package:to_do_app/screens/on_boarding/on_boarding_screen.dart';
import 'package:to_do_app/screens/splash/splash_screen.dart';
import 'package:to_do_app/screens/tab/profile/category_screen.dart';
import 'package:to_do_app/screens/tab/profile/create_category.dart';
import 'package:to_do_app/screens/tab/tab_box.dart';
import 'package:to_do_app/screens/welcome/welcome_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return navigate(const SplashScreen());
      case RouteNames.tabBox:
        return navigate(const TabBox());
        case RouteNames.onBoarding:
        return navigate(const OnBoardingScreen());
      case RouteNames.welcome:
        return navigate(const WelcomeScreen());
      case RouteNames.category:
        return navigate(const CategoryScreen());
      case RouteNames.categoryCreate:
        return navigate(const CreateCategory());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text("This kind of rout does not exist!"),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String splash = "/";
  static const String tabBox = "/tab_route";
  static const String welcome = "/welcome_route";
  static const String onBoarding = "/boarding_route";
  static const String category= "/category_route";
  static const String categoryCreate= "/category_create_route";
}
