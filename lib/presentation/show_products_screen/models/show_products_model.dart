import '../../../core/app_export.dart';
import 'userprofile_item_model.dart';

/// This class defines the variables used in the [show_products_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class ShowProductsModel {
  Rx<List<UserprofileItemModel>> userprofileItemList = Rx([
    UserprofileItemModel(
        userImage: ImageConstant.imgRectangle39.obs,
        exampleText: "this is example ".obs,
        numberText: "120".obs,
        currencyText: "SAR".obs,
        storeName: "Store name".obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgRectangle45.obs,
        exampleText: "this is example ".obs,
        numberText: "120".obs,
        currencyText: "SAR".obs,
        storeName: "Store name".obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgRectangle41.obs,
        exampleText: "this is example ".obs,
        numberText: "120".obs,
        currencyText: "SAR".obs,
        storeName: "Store name".obs),
    UserprofileItemModel(
        userImage: ImageConstant.imgRectangle46.obs,
        exampleText: "this is example ".obs,
        numberText: "120".obs,
        currencyText: "SAR".obs,
        storeName: "Store name".obs)
  ]);
}
