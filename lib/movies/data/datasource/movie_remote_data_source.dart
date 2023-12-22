import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/core/utils/constant/constants.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
abstract class BaseMovieDataSource{
  Future<List<MovieModel>> GetNowPlaying();
  Future<List<MovieModel>> GetPopularPlaying();
  Future<List<MovieModel>> TopRatedPlaying();

}
class MovieRemoteDataSource extends BaseMovieDataSource{
@override
  Future<List<MovieModel>> GetNowPlaying()async{
final response= await Dio().get("${ApiConstants.BaseUrl}${ApiConstance.nowPlayingMovies}${ApiConstance.apiKey}");

if(response.statusCode==200){
  return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromjson(e)));
}
else {
  throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromjson(response.data));
}

  }

  @override
  Future<List<MovieModel>> GetPopularPlaying() async{
    final response= await Dio().get("${ApiConstants.BaseUrl}${ApiConstance.popularMovies}${ApiConstance.apiKey}");

    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromjson(e)));
    }
    else {
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }

  }

  @override
  Future<List<MovieModel>> TopRatedPlaying() async{
    final response= await Dio().get("${ApiConstants.BaseUrl}${ApiConstance.topRatedMovies}${ApiConstance.apiKey}");

    if(response.statusCode==200){
      return List<MovieModel>.from((response.data["results"]as List).map((e) => MovieModel.fromjson(e)));
    }
    else {
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromjson(response.data));
    }

  }
}