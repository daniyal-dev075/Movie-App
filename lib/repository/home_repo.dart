import 'package:movie_app/model/MovieListModel.dart';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/app_urls.dart';

class HomeRepo {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<MovieListModel> movieListApi() async {
    try{
      dynamic response = await _apiServices.getApiResponse(AppUrls.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
}