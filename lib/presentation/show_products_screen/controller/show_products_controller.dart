import 'dart:convert';

import 'package:awabtest/core/app_export.dart';
import 'package:awabtest/presentation/add_product_screen/models/add_product_model.dart';
import 'package:awabtest/presentation/show_products_screen/models/show_products_model.dart';
import 'package:awabtest/presentation/show_products_screen/models/userprofile_item_model.dart';
import 'package:get_storage/get_storage.dart';

/// A controller class for the ShowProductsScreen.
///
/// This class manages the state of the ShowProductsScreen, including the
/// current showProductsModelObj
class ShowProductsController extends GetxController {
  final box = GetStorage();

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

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    showProductsModelObj.value.userprofileItemList.value.clear();
    var jsonText = box.read("products");
    var decodedText = jsonDecode(jsonText);
    for (var element in decodedText) {
      showProductsModelObj.value.userprofileItemList.value.add(
          UserprofileItemModel(
              userImage: element["image"].toString().obs,
              exampleText: element["title"].toString().obs,
              numberText: element["price"].toString().obs,
              currencyText: "SAR".obs,
              storeName: element["store"].toString().obs));
    }
    update();
  }
}
