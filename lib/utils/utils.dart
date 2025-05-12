import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/res/app_colours.dart';
import 'package:flutter/material.dart';

class Utils {
  static double averageRating(List<num> rating){
    num avgRating = 0;
    for(int i=0;i<rating.length;i++){
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating/rating.length).toString());
  }

  static changeFocus(BuildContext context,FocusNode current,FocusNode nextFocus){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }


  static toastMessage(String message){
    Fluttertoast.showToast(
      backgroundColor: AppColours.lightGreenContainer,
        textColor: Colors.white,
        msg: message);
  }
  static flushbarMessage(BuildContext context, String message) {
    Flushbar(
      message: message,
      backgroundColor: AppColours.lightGreenContainer,
      duration: const Duration(seconds: 2), // optional but recommended
    ).show(context);
  }

}