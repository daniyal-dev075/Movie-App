import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:movie_app/repository/auth_repo.dart';
import 'package:movie_app/utils/routes/route_name.dart';
import 'package:movie_app/view_model/user_view_model.dart';

import '../model/user_model.dart';
import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myrepo = AuthRepo();
  Future<void> loginApi(dynamic data,BuildContext context) async {
    _myrepo.loginApi(data).then((value) async {
      final token = value['token'];
      await UserViewModel().saveUser(UserModel(token: token));
      Utils.toastMessage('Logged In Successfully');
      Navigator.pushNamed(context, RouteName.homeScreen);
      if(kDebugMode){
        print(value.toString());
        print(data);
      }
    }).onError((error, stackTrace){
      Utils.toastMessage('Login Failed');
      if(kDebugMode){
        print(error.toString());
      }
    });
  }
}