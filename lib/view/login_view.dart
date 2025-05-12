import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/res/app_colours.dart';
import 'package:movie_app/res/components/button_container.dart';
import 'package:movie_app/res/components/textfield_container.dart';
import 'package:movie_app/utils/routes/route_name.dart';
import 'package:movie_app/view_model/auth_view_model.dart';
import 'package:movie_app/view_model/password_view_model.dart';
import 'package:movie_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  @override
  Widget build(BuildContext context) {
    final passwordProvider = Provider.of<PasswordViewModel>(context);
    final authViewModel = Provider.of<AuthViewModel>(context);
    final userPreferences = Provider.of<UserViewModel>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
            backgroundColor: AppColours.backgroundColour),
        backgroundColor: AppColours.backgroundColour,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi Welcome\nBack!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Email Address',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: TextfieldContainer(
                  focusNode: emailFocus,
                  onFieldSubmitted: (value) {
                    Utils.changeFocus(context, emailFocus, passwordFocus);
                  },
                  controller: emailController,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: AppColours.lightGreenContainer,
                  ),
                  hintText: 'Email',
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.only(left: 28.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('Password', style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 5.h),
            Consumer<PasswordViewModel>(
              builder: (context, value, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: TextfieldContainer(
                      focusNode: passwordFocus,
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: passwordProvider.isObscure,
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: AppColours.lightGreenContainer,
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          passwordProvider.toggleVisibility();
                        },
                        child:
                            passwordProvider.isObscure
                                ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: AppColours.lightGreenContainer,
                                )
                                : Icon(
                                  Icons.visibility_outlined,
                                  color: AppColours.lightGreenContainer,
                                ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 5.h),
            Padding(
              padding: const EdgeInsets.only(right: 28.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: AppColours.buttonColour,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColours.buttonColour,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Consumer<AuthViewModel>(builder: (context,value,child){
              return ButtonContainer(
                title: 'LogIn',
                onPress: () {
                  if(emailController.text.isEmpty){
                    Utils.toastMessage('Please Enter Email');
                  } else if(passwordController.text.isEmpty){
                    Utils.toastMessage('Please Enter Password');
                  }else if(passwordController.text.length < 6){
                    Utils.toastMessage('Password must be more than 6 letters');
                  }else{
                    Map data = {
                      'email' : emailController.text.trim(),
                      'password' : passwordController.text.trim()
                    };
                    authViewModel.loginApi(data,context);
                  }
                },
              );
            }),
            SizedBox(height: 35.h),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Or Continue with',
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
            SizedBox(height: 35.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColours.lightGreenContainer,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Icon(Icons.facebook, size: 32.r, color: Colors.blue),
                  ),
                ),
                SizedBox(width: 15.w),
                Container(
                  height: 50.h,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: AppColours.lightGreenContainer,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Icon(Icons.apple, size: 32.r, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an Account?',
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
                SizedBox(width: 2.w),
                Text(
                  'Register',
                  style: TextStyle(
                    color: AppColours.buttonColour,
                    fontSize: 16.sp,
                    decoration: TextDecoration.underline,
                    decorationColor: AppColours.buttonColour,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
