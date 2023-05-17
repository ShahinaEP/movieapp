part of 'details_bloc.dart';

@immutable
abstract class DetailsEvent extends Equatable{}

class GetDetailsEvent extends DetailsEvent {
  @override
  List<Object?> get props => [];
}