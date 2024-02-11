import '../controller/add_product_controller.dart';
import 'package:get/get.dart';

/// A binding class for the AddProductScreen.
///
/// This class ensures that the AddProductController is created when the
/// AddProductScreen is first loaded.
class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductController());
  }
}
