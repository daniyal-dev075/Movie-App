import 'package:movie_app/data/app_exceptions.dart';
import 'package:movie_app/data/network/BaseApiServices.dart';
import 'package:movie_app/data/network/NetworkApiServices.dart';
import 'package:movie_app/res/app_urls.dart';

class AuthRepo{
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response = await _apiServices.postApiResponse(AppUrls.loginUrl, data);
      return response;
    }catch(e){
      throw e;
    }
  }
}