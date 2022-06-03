abstract class HomeCubitAB {

  void getInitialEventData();

  void disposeScrollController();

  Future<void> loadMore();

  Future<void> onSearch();

  Future<void> callEventDataAPI();
}