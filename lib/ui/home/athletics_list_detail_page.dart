import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../constant/app_assets.dart';
import '../../constant/color_constant.dart';
import '../../constant/font_style.dart';
import '../../cubit/home/home_cubit.dart';

class AthleticsListDetailPage extends StatefulWidget {
  const AthleticsListDetailPage({Key? key}) : super(key: key);

  @override
  State<AthleticsListDetailPage> createState() =>
      _AthleticsListDetailPageState();
}

class _AthleticsListDetailPageState extends State<AthleticsListDetailPage> {
  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    final _homeModel = homeCubit.currentSelectedHomeModel;
    final index = homeCubit.currentSelectedItemIndex;
    bool isFavorited = homeCubit.homeModelList?[index]?.isFavorited ?? false;

    final queryData = MediaQuery.of(context);
    DateTime createdAt = _homeModel?.createdAt ?? DateTime.now();
    String formattedDate = DateFormat.yMMMEd().format(createdAt);

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
                  _homeModel?.title ?? 'Title',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: AppFontStyle.textXXNormalBold(color: AppColors.black),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                    (isFavorited) ? Icons.favorite : Icons.favorite_border,
                    color: AppColors.favorite),
                onPressed: () {
                  homeCubit.homeModelList?[index]?.isFavorited = !(isFavorited);
                  homeCubit.updateFavoriteSelection();
                  setState(() {});
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
                _homeModel?.shortTitle ?? 'shortTitle',
                style: AppFontStyle.textXNormal(color: AppColors.blackLight),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
