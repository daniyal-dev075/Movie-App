import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/model/user_model.dart';
import 'package:movie_app/utils/routes/route_name.dart';
import 'package:movie_app/view_model/user_view_model.dart';

class SplashServices{
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuthentication(BuildContext context){
    getUserData().then((value)async{
      print(value.token);
      if(value.token == null || value.token == ''){
        await Future.delayed(Duration(seconds: 6));
        Navigator.pushNamed(context, RouteName.loginView);
      }else{
        await Future.delayed(Duration(seconds: 6));
        Navigator.pushNamed(context, RouteName.homeScreen);
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }

    });
  }
}