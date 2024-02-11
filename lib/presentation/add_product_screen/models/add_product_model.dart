import '../../../core/app_export.dart';
import 'addproductlist_item_model.dart';

/// This class defines the variables used in the [add_product_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class AddProductModel {
  Rx<List<AddproductlistItemModel>> addproductlistItemList = Rx([
    AddproductlistItemModel(image: ImageConstant.imgRectangle8088.obs),
    AddproductlistItemModel(image: ImageConstant.imgRectangle8089.obs)
  ]);

  Rx<List<SelectionPopupModel>> dropdownItemList = Rx([
    SelectionPopupModel(
      id: 1,
      title: "Item One",
      isSelected: true,
    ),
    SelectionPopupModel(
      id: 2,
      title: "Item Two",
    ),
    SelectionPopupModel(
      id: 3,
      title: "Item Three",
    )
  ]);
}
