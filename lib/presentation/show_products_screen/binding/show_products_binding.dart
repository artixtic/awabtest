import '../controller/show_products_controller.dart';
import 'package:get/get.dart';

/// A binding class for the ShowProductsScreen.
///
/// This class ensures that the ShowProductsController is created when the
/// ShowProductsScreen is first loaded.
class ShowProductsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShowProductsController());
  }
}
