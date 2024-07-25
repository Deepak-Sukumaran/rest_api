import 'package:api_integration/Service/ApiService.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
// obs - observable
  RxBool isLoading = true.obs;
  RxList productList = [].obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading(true);
      var products = await HttpSercvice.fetchProducts();
      productList.value = products;
        } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
