import 'package:digital14_flutter_task/cubit/home/home_cubit_abstraction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/home_model.dart';
import '../../repository/data_source_manager/base_response.dart';
import '../../repository/data_source_manager/response_wrapper.dart';
import '../../repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> implements HomeCubitAB {
  HomeRepository homeRepository;

  HomeCubit(this.homeRepository) : super(HomeInitialState());

  // At the beginning, we fetch the first 10 posts
  int _page = 1;

  // There is next page or not
  bool _hasNextPage = true;
  // We have manage here the oop's encapsulation principle
  bool get hasNextPage => _hasNextPage;
  set hasNextPage(value) {
    _hasNextPage = value;
  }

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;
  // We have manage here the oop's encapsulation principle
  bool get isLoadMoreRunning => _isLoadMoreRunning;

  // This holds the events which we have fetched from the server
  List<HomeModel?>? _homeModelList;
  List<HomeModel?>? get homeModelList => _homeModelList;
  set homeModelList(value) {
    _homeModelList = value;
  }

  // For favorite & un-favorite cases
  int currentSelectedItemIndex = 0;
  HomeModel? currentSelectedHomeModel = HomeModel();

  // The controller for the ListView Builder
  late ScrollController scrollController;

  String searchTextFieldControllerValue = '';
  bool get isSearchOn => searchTextFieldControllerValue != '';

  //Actual API call for event data
  @override
  Future<void> callEventDataAPI() async {
    try {
      (_page == 1 && !isSearchOn)
          ? emit(HomeLoadingState())
          : emit(HomePaginationLoadingState());
      ResponseWrapper<BaseResponse<List<HomeModel?>?>> responseWrapper =
      await homeRepository.getEventsData(
          page: _page.toString(), searchString: searchTextFieldControllerValue);
      if (responseWrapper.hasException) {
        emit(HomeErrorState(
            error: await responseWrapper.getException.errorMessage));
      } else {
        if (responseWrapper.getData.events?.length == 0) {
          // This means there is no more data
          // And therefore, we will not send another GET request
          homeModelList = null;
          hasNextPage = false;
        }
        emit(HomeSuccessState(baseResponse: responseWrapper.getData));
      }
    } catch (e) {
      emit(HomeErrorState(error: e));
    }
  }

  @override
  void getInitialEventData() {
    scrollController = ScrollController()..addListener(loadMore);
    callEventDataAPI();
  }

  @override
  void disposeScrollController() {
    scrollController.removeListener(loadMore);
    scrollController.dispose();
  }

  @override
  Future<void> loadMore() async {
    if (_hasNextPage &&
        !_isLoadMoreRunning &&
        scrollController.position.extentAfter < 300) {
      _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      _page += 1; // Increase _page by 1
      await callEventDataAPI();
      _isLoadMoreRunning = false;
    }
  }

  @override
  Future<void> onSearch() async {
      reSetPaginationData();
      await callEventDataAPI();
  }

  void searchTextFieldListener(String value) {
    searchTextFieldControllerValue = value;
    onSearch();
  }

  void clearSearchTextField() {
    searchTextFieldControllerValue = '';
    reSetPaginationData();
    callEventDataAPI();
  }

  void updateFavoriteSelection() {
    emit(HomeUpdateFavoriteSelectionState());
  }
}

extension _ on HomeCubit {

  void reSetPaginationData() {
    _page = 1;
    homeModelList = null;
    hasNextPage = true;
  }
}