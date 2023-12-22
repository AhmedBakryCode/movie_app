import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepo{
  Future<Either<Failure,List<Movie>>> GetNowPlaying();
  Future<Either<Failure,List<Movie>>> GetPopularPlaying();
  Future<Either<Failure,List<Movie>>> GetTopRatedMovies();

}