part of 'movie_bloc.dart';

@immutable
abstract class MovieEvent extends Equatable{
  const MovieEvent();
}

class LoadMovieEvent extends MovieEvent {
  @override
  List<Object?> get props => [];
}