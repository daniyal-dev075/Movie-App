import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/route_name.dart';
import 'package:movie_app/utils/routes/routes.dart';
import 'package:movie_app/view_model/auth_view_model.dart';
import 'package:movie_app/view_model/password_view_model.dart';
import 'package:movie_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => PasswordViewModel()),
      ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ChangeNotifierProvider(create: (_) => UserViewModel())
    ],
        child: ScreenUtilInit(
          designSize: Size(360, 800),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context,child){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              initialRoute: RouteName.splashView,
              onGenerateRoute: Routes.generateRoute,
            );
          },
        )
    );

  }
}
