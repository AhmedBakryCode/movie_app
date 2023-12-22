import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class MoviesRepository extends BaseMovieRepo{
final BaseMovieDataSource baseMovieDataSource;

  MoviesRepository(this.baseMovieDataSource);
  @override
  Future<Either<Failure,List<Movie>>> GetNowPlaying() async{
final result= await baseMovieDataSource.GetNowPlaying();

try{
  return Right(result);
}on ServerExceptions catch(failure){
  return Left(ServerFailure(failure.errorMessageModel.statusMassage));
}
  }

  @override
  Future<Either<Failure,List<Movie>>> GetPopularPlaying()async {
    final result= await baseMovieDataSource.GetPopularPlaying();

    try{
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMassage));
    }  }

  @override
  Future<Either<Failure,List<Movie>>>GetTopRatedMovies() async{
    final result= await baseMovieDataSource.TopRatedPlaying();

    try{
      return Right(result);
    }on ServerExceptions catch(failure){
      return Left(ServerFailure(failure.errorMessageModel.statusMassage));
    }  }


}