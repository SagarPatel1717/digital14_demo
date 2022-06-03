import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/app_routes.dart';
import '../../../constant/app_assets.dart';
import '../../../constant/color_constant.dart';
import '../../../constant/font_style.dart';
import '../../../cubit/home/home_cubit.dart';
import '../../../model/home_model.dart';

class AthleticsListItem extends StatelessWidget {
  final HomeModel? homeModel;
  final int index;
  AthleticsListItem({required this.homeModel, required this.index});

  @override
  Widget build(BuildContext context) {
    DateTime createdAt = homeModel?.createdAt ?? DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(createdAt);
    final homeCubit = BlocProvider.of<HomeCubit>(context);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        homeCubit.currentSelectedItemIndex = index;
        homeCubit.currentSelectedHomeModel = homeModel;
        Get.toNamed(Routes.athleticsListDetailPage);
      },
      child: Container(
        width: 250,
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 68,
                  height: 68,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6.0),
                    child: FadeInImage.assetNetwork(
                      fit: BoxFit.cover,
                      placeholder: AssetImages.placeHolderLoader,
                      image: homeModel?.performers?.first.image ??
                          AssetImages.placeHolderImage,
                    ),
                  ),
                ),
                if (homeCubit.homeModelList?[index]?.isFavorited ?? false)
                  Positioned(
                    child: Icon(Icons.favorite,
                        color: AppColors.favorite, size: 20),
                    top: 0,
                    left: 0,
                  ),
              ],
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    homeModel?.title ?? 'title',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFontStyle.textXNormalBold(color: AppColors.black),
                  ),
                  Text(
                    homeModel?.shortTitle ?? 'shortTitle',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFontStyle.textNormal(color: AppColors.blackLight),
                  ),
                  Text(
                    formattedDate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppFontStyle.textNormal(color: AppColors.blackLight),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
