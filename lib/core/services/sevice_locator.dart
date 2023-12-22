
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/reposittory/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_playing.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movie.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_bloc.dart';

final sl=GetIt.instance;
class ServiceLocator{
void init(){
sl.registerFactory(() => MoviesBloc(sl(),sl(),sl()));
  sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
  sl.registerLazySingleton(() => GetPopularPlayingUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedUseCase(sl()));

  sl.registerLazySingleton<BaseMovieRepo>(() => MoviesRepository(sl()));
  sl.registerLazySingleton<BaseMovieDataSource>(() => MovieRemoteDataSource());

}
}