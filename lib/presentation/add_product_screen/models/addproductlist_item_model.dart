import '../../../core/app_export.dart';

/// This class is used in the [addproductlist_item_widget] screen.
class AddproductlistItemModel {
  AddproductlistItemModel({
    this.image,
    this.id,
  }) {
    image = image ?? Rx(ImageConstant.imgRectangle8088);
    id = id ?? Rx("");
  }

  Rx<String>? image;

  Rx<String>? id;
}
