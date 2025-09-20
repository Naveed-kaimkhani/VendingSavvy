import 'package:get/get.dart';
import 'package:vendingsavvy/controllers/auth_controllers.dart';
import 'package:vendingsavvy/controllers/product_controller.dart';
import 'package:vendingsavvy/controllers/splashcontroller.dart';
import 'package:vendingsavvy/controllers/user_controller.dart';

// import 'package:sms/controller/authcontroller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());


    Get.lazyPut(() => UserController());
   Get.lazyPut(
      () => ProductController(productRepo: Get.find()),
    ); 
   
  }
}
