part of 'details_bloc.dart';

@immutable
abstract class DetailsState extends Equatable {}

class DetailsInitial extends DetailsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieLoading extends DetailsState {

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class MovieLoaded extends DetailsState {
  final MovieDetailsModel movie;
  MovieLoaded(this.movie);
  @override
  // TODO: implement props
  List<Object?> get props => [movie];
}

class MovieError extends DetailsState {

  final String error;

  MovieError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
