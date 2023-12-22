import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularPlayingUseCase{
  final BaseMovieRepo baseMovieRepo;


  GetPopularPlayingUseCase(this.baseMovieRepo);

  Future<Either<Failure,List<Movie>>>excute() async{
    return await baseMovieRepo.GetPopularPlaying();
  }
}