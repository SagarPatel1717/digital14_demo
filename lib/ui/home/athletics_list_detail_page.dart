import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../constant/app_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_style.dart';
import '../../cubit/home/home_cubit.dart';
import '../../generated/l10n.dart';

class AthleticsListDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final _homeModel = homeCubit.currentSelectedHomeModel;
    final index = homeCubit.currentSelectedItemIndex;

    final queryData = MediaQuery.of(context);
    DateTime createdAt = _homeModel?.createdAt ?? DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(createdAt);

    //valueNotifier to rebuild only one widget
    ValueNotifier<bool> isFavorited =
        ValueNotifier(homeCubit.homeModelList?[index]?.isFavorited ?? false);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.backIcon),
        backgroundColor: AppColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                child: Text(
                  _homeModel?.title ?? S.of(context).title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppFontStyle.textXXNormalBold(color: AppColors.black),
                ),
              ),
            ),
            // we can also use blocbuilder here
            // but ValueListenableBuilder is just to show case the use for
            // future uses in some scenario where we don't inject or create
            // the blocs for small uses and just want to rebuild
            // widget independently.
            Expanded(
              flex: 1,
              child: ValueListenableBuilder<bool>(
                valueListenable: isFavorited,
                builder: (context, isFavorite, child) {
                  return IconButton(
                    icon: Icon(
                        (isFavorite) ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.favorite),
                    onPressed: () {
                      // this is to update the home list favorite icon
                      // which we takes in stack
                      homeCubit.homeModelList?[index]?.isFavorited =
                          !isFavorited.value;
                      // update the value of valueNotifier to rebuild only
                      // IconButton widget of this stateless widget
                      isFavorited.value = !isFavorited.value;
                      // emit state so that home list have the latest value
                      homeCubit.updateFavoriteSelection();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(),
              SizedBox(
                height: 12,
              ),
              Container(
                height: queryData.size.width,
                width: queryData.size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: FadeInImage.assetNetwork(
                    fit: BoxFit.cover,
                    placeholder: AssetImages.placeHolderLoader,
                    image: _homeModel?.performers?.first.image ??
                        AssetImages.placeHolderImage,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(formattedDate,
                  style:
                      AppFontStyle.textXXXNormalBold(color: AppColors.black)),
              SizedBox(
                height: 12,
              ),
              Text(
                _homeModel?.shortTitle ?? S.of(context).shortTitle,
                style: AppFontStyle.textXNormal(color: AppColors.blackLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
