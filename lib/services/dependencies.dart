
import 'package:get/get.dart';
import 'package:vendingsavvy/repositries/auth_repo.dart';
import 'package:vendingsavvy/repositries/product_repo.dart';
import 'package:vendingsavvy/services/api_client.dart';

Future<void> init() async {

  Get.lazyPut(() => ApiClient());

  Get.lazyPut(() => AuthRepository(apiClient: Get.find()));
    Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  

}
