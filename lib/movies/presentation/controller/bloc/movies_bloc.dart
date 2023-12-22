import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/constant/enums.dart';
import 'package:movies_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/reposittory/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_playing.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movie.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/bloc/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent,MoviesState>{
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularPlayingUseCase popularPlayingUseCase;
  final GetTopRatedUseCase getTopRatedUseCase;
  MoviesBloc(this.getNowPlayingUseCase,this.getTopRatedUseCase,this.popularPlayingUseCase):super( MoviesState()){
    on<GetNowPlayingEvent>((event,emit)async{
      BaseMovieDataSource baseMovieDataSource=MovieRemoteDataSource();
      BaseMovieRepo baseMovieRepo=MoviesRepository(baseMovieDataSource);
      final result=await GetNowPlayingUseCase(baseMovieRepo).excute();
      emit( MoviesState(requestState: RequestState.loaded));
    result.fold((l) => emit(MoviesState(
      message: l.message,
      requestState: RequestState.error,
    )), (r) => emit(MoviesState(nowPlayingMovies: r,requestState: RequestState.loaded)));



      on<GetPopularEvent>((event,emit)async{
        BaseMovieDataSource baseMovieDataSource=MovieRemoteDataSource();
        BaseMovieRepo baseMovieRepo=MoviesRepository(baseMovieDataSource);
        final result=await GetPopularPlayingUseCase(baseMovieRepo).excute();
        emit( MoviesState(requestState: RequestState.loaded));
        result.fold((l) => emit(MoviesState(
PopularState: RequestState.loaded,
PopularMessage: l.message
        )), (r) => emit(MoviesState(PopularMovies: r,PopularState: RequestState.loaded)));


        on<GetNowTopRatedEvent>((event,emit)async{
          BaseMovieDataSource baseMovieDataSource=MovieRemoteDataSource();
          BaseMovieRepo baseMovieRepo=MoviesRepository(baseMovieDataSource);
          final result=await GetPopularPlayingUseCase(baseMovieRepo).excute();
          emit( MoviesState(requestState: RequestState.loaded));
          result.fold((l) => emit(MoviesState(
              TopRatedState: RequestState.loaded,
              TopRatedmessage: l.message
          )), (r) => emit(MoviesState(TopRatedMovies: r,TopRatedState: RequestState.loaded)));



  }

}