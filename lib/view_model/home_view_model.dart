import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/data/response/api_response.dart';
import 'package:movie_app/model/MovieListModel.dart';
import 'package:movie_app/repository/home_repo.dart';

class HomeViewModel with ChangeNotifier{
  final _myrepo = HomeRepo();
  ApiResponse<MovieListModel> movieList = ApiResponse.loading();
  setMovieList(ApiResponse<MovieListModel> response){
    movieList =response;
    notifyListeners();
  }
  Future<void> FetchMovieListApi() async {
    setMovieList(ApiResponse.loading());
    _myrepo.movieListApi().then((value){
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      if(kDebugMode){
        setMovieList(ApiResponse.error(error.toString()));
      }
    });
  }
}