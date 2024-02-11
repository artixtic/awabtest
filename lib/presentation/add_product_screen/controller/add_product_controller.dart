import 'package:awabtest/core/app_export.dart';
import 'package:awabtest/presentation/add_product_screen/models/add_product_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the AddProductScreen.
///
/// This class manages the state of the AddProductScreen, including the
/// current addProductModelObj
class AddProductController extends GetxController {
  TextEditingController productNameEditTextController = TextEditingController();

  TextEditingController storeNameEditTextController = TextEditingController();

  TextEditingController priceEditTextController = TextEditingController();

  Rx<AddProductModel> addProductModelObj = AddProductModel().obs;

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onClose() {
    super.onClose();
    productNameEditTextController.dispose();
    storeNameEditTextController.dispose();
    priceEditTextController.dispose();
  }

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
    // Future.delayed(const Duration(milliseconds: 3000), () {
    //   Get.offNamed(
    //     AppRoutes.showProductsScreen,
    //   );
    // });
  }
}
