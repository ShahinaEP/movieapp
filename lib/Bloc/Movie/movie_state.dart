part of 'movie_bloc.dart';

@immutable
abstract class MovieState  extends Equatable {}

class MovieInitial extends MovieState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class MovieLoaded extends MovieState {
  final HomePageModel movie;
  MovieLoaded(this.movie);
  @override
  // TODO: implement props
  List<Object?> get props => [movie];
}

class MovieError extends MovieState {

  final String error;

  MovieError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}