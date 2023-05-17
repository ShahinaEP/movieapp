import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../Model/HomePageModel.dart';
import '../../httpService/homeData.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async{
      emit(MovieInitial());
      try {
        final users = await HttpHomepage().getHomePageMovie();
        emit(MovieLoaded(users!));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
}
