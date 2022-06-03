import 'package:digital14_flutter_task/ui/home/widgets/athletics_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/app_loader.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_style.dart';
import '../../cubit/home/home_cubit.dart';
import '../../generated/l10n.dart';
import '../../utils/shared_pref_utils.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? clientID;
  TextEditingController searchTextFieldController = TextEditingController();
  bool isSearchOn = false;

  @override
  void dispose() {
    BlocProvider.of<HomeCubit>(context).disposeScrollController();
    searchTextFieldController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getInitialEventListFromAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case HomeInitialState:
              case HomeLoadingState:
                AppLoader.show(context);
                break;
              case HomePaginationLoadingState:
              case HomeUpdateFavoriteSelectionState:
                break;
              case HomeSuccessState:
                isSearchOn = false;
                final _state = state as HomeSuccessState;
                if (homeCubit.homeModelList == null) {
                  homeCubit.homeModelList = _state.baseResponse?.events ?? [];
                } else {
                  homeCubit.homeModelList
                      ?.addAll(_state.baseResponse?.events ?? []);
                }
                AppLoader.hide();
                break;
              case HomeErrorState:
                AppLoader.hide();
                break;
            }
          },
          builder: (context, state) {
            return Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: AppColors.searchBarInnerColor,
                        child: ListTile(
                          leading: Icon(
                            Icons.search,
                            color: AppColors.white,
                          ),
                          title: TextField(
                            style:
                                TextStyle(color: AppColors.white, fontSize: 17),
                            controller: searchTextFieldController,
                            onChanged: (value) {
                              isSearchOn = true;
                              homeCubit.searchTextFieldListener(value);
                            },
                            onSubmitted: (value) {
                              // We can use this method,
                              // if we want to perform search operation
                              // when user click done on keyboard
                            },
                            decoration: InputDecoration(
                                hintText: S.of(context).search,
                                border: InputBorder.none),
                          ),
                          trailing: IconButton(
                            color: AppColors.white,
                            icon: Icon(Icons.cancel),
                            onPressed: () {
                              searchTextFieldController.clear();
                              homeCubit.clearSearchTextField();
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (homeCubit.homeModelList?.length != 0 &&
                      homeCubit.homeModelList != null)
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(
                            left: 8, top: 8, bottom: 16, right: 16),
                        controller: homeCubit.scrollController,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                        itemCount: homeCubit.homeModelList?.length ?? 0,
                        itemBuilder: (BuildContext context, int index) {
                          return AthleticsListItem(
                            homeModel: homeCubit.homeModelList?[index],
                            index: index,
                          );
                        },
                      ),
                    ),

                  // when the _loadMore function is running
                  if (homeCubit.isLoadMoreRunning)
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 40),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),

                  // when the user search is on going
                  if (isSearchOn)
                    Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),

                  // When nothing else to load
                  if (!homeCubit.hasNextPage)
                    Container(
                      padding: const EdgeInsets.only(top: 30, bottom: 40),
                      color: AppColors.primaryColor,
                      child: Center(
                        child: Text(
                          'There is no more data for this search',
                          style:
                              AppFontStyle.textXNormal(color: AppColors.white),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

extension _ on _HomePageState {
  Future<void> getInitialEventListFromAPI() async {
    //We assume that in our Rest API or GraphQL endpoint will give us the clientID or token to call api for real project
    //So that's why we go with this scenario to set and then fetch clientId from shared preferences (android: shared preferences, iOS: UserDefaults)
    await SharedPrefUtils.setClientId(
        clientId: 'MjcyNDIwMDl8MTY1NDA4ODE5Mi41ODk0MzMy');
    BlocProvider.of<HomeCubit>(context).getInitialEventData();
  }
}
