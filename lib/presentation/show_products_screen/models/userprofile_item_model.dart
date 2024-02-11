import '../../../core/app_export.dart';

/// This class is used in the [userprofile_item_widget] screen.
class UserprofileItemModel {
  UserprofileItemModel({
    this.userImage,
    this.exampleText,
    this.numberText,
    this.currencyText,
    this.storeName,
    this.id,
  }) {
    userImage = userImage ?? Rx(ImageConstant.imgRectangle39);
    exampleText = exampleText ?? Rx("this is example ");
    numberText = numberText ?? Rx("120");
    currencyText = currencyText ?? Rx("SAR");
    storeName = storeName ?? Rx("Store name");
    id = id ?? Rx("");
  }

  Rx<String>? userImage;

  Rx<String>? exampleText;

  Rx<String>? numberText;

  Rx<String>? currencyText;

  Rx<String>? storeName;

  Rx<String>? id;
}
