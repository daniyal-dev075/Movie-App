import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/route_name.dart';
import 'package:movie_app/view/home_creen.dart';
import 'package:movie_app/view/login_view.dart';
import 'package:movie_app/view/splash_view.dart';

class Routes {
static Route<dynamic> generateRoute(RouteSettings settings){
  switch(settings.name){
    case RouteName.splashView:
      return MaterialPageRoute(builder: (BuildContext context) => SplashView());
    case RouteName.loginView:
      return MaterialPageRoute(builder: (BuildContext context) => LoginView());
    case RouteName.homeScreen:
      return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());
    default:
      return MaterialPageRoute(builder: (_){
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text('No Route Found'),)
            ],
          ),
        );
      });
  }
}
}