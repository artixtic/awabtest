import 'package:awabtest/presentation/add_product_screen/add_product_screen.dart';
import 'package:awabtest/presentation/add_product_screen/binding/add_product_binding.dart';
import 'package:awabtest/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:awabtest/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:awabtest/presentation/show_products_screen/binding/show_products_binding.dart';
import 'package:awabtest/presentation/show_products_screen/show_products_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String addProductScreen = '/add_product_screen';

  static const String showProductsScreen = '/show_products_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: addProductScreen,
      page: () => AddProductScreen(),
      bindings: [
        AddProductBinding(),
      ],
    ),
    GetPage(
      name: showProductsScreen,
      page: () => ShowProductsScreen(),
      bindings: [
        ShowProductsBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => AddProductScreen(),
      bindings: [
        AddProductBinding(),
      ],
    )
  ];
}
