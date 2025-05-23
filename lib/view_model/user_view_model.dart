import 'package:flutter/widgets.dart';
import 'package:movie_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier{
Future<bool> saveUser(UserModel user)async{
  final SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setString('token', user.token.toString());
  notifyListeners();
  return true;
}
Future<UserModel> getUser() async {
  final SharedPreferences sp = await SharedPreferences.getInstance();
  final String? token = sp.getString('token');
  return UserModel(
    token: token
  );
}
Future<bool> removeUser()async{
  final SharedPreferences sp = await SharedPreferences.getInstance();
  return sp.remove('token');

}
}