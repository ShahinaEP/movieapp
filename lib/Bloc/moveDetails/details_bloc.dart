import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../Model/MovieDetails.dart';
import '../../httpService/MovieDetails.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc(id) : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) async {
      emit(MovieLoading());
      try {
        final users = await HttpMovieDetails().getMovieDetail(id);
        emit(MovieLoaded(users!));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
// HttpMovieDetails