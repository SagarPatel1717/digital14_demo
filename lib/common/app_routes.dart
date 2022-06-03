import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/home/athletics_list_detail_page.dart';
import '../ui/home/home_page.dart';

final routes = [
  GetPage(
    name: Routes.homePage,
    page: () => HomePage(),
  ),
  GetPage(
    name: Routes.athleticsListDetailPage,
    page: () => AthleticsListDetailPage(),
  ),
];

abstract class Routes {
  static const root = '/';
  static const homePage = '/homePage';
  static const athleticsListDetailPage = '/athleticsListDetailPage';
}
