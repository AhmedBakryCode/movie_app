import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/constant/enums.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState requestState;
  final String message;
  final List<Movie> PopularMovies;
  final RequestState PopularState;
  final String PopularMessage;
  final List<Movie> TopRatedMovies;
  final RequestState TopRatedState;
  final String TopRatedmessage;


  MoviesState({this.PopularMovies=const[],
    this.PopularState=RequestState.loaded,
  this.PopularMessage="",
  this.TopRatedMovies=const[],
  this.TopRatedState=RequestState.loaded,
  this.TopRatedmessage="",
  this.nowPlayingMovies=const[],
    this.requestState=RequestState.loading,
    this.message=""});

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    requestState,
    message,
    PopularMessage,
    PopularMovies,
    PopularState,
    TopRatedmessage,
    TopRatedMovies,
    TopRatedState,
  ];
}
