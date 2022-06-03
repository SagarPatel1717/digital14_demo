part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomePaginationLoadingState extends HomeState {}

class HomeUpdateFavoriteSelectionState extends HomeState {}

class HomeSuccessState extends HomeState {
  final BaseResponse<List<HomeModel?>?>? baseResponse;
  HomeSuccessState({this.baseResponse});
}

class HomeErrorState extends HomeState {
  final dynamic error;
  HomeErrorState({this.error});
}
