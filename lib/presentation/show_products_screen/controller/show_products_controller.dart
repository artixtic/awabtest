import 'package:awabtest/core/app_export.dart';
import 'package:awabtest/presentation/add_product_screen/models/add_product_model.dart';
import 'package:awabtest/presentation/show_products_screen/models/show_products_model.dart';

/// A controller class for the ShowProductsScreen.
///
/// This class manages the state of the ShowProductsScreen, including the
/// current showProductsModelObj
class ShowProductsController extends GetxController {
  Rx<ShowProductsModel> showProductsModelObj = ShowProductsModel().obs;
  Rx<AddProductModel> addProductModelObj = AddProductModel().obs;
  onSelected(dynamic value) {
    for (var element in addProductModelObj.value.dropdownItemList.value) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    }
    addProductModelObj.value.dropdownItemList.refresh();
  }
}
