import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Add this
import 'package:get/get.dart';

import 'package:vendingsavvy/appbinding.dart/appbinding.dart';
import 'package:vendingsavvy/constant/route_constants.dart' show RouteConstants;
import 'package:vendingsavvy/constant/routemanagment.dart' show AppRouters;
import 'package:vendingsavvy/services/dependencies.dart' as dep show init;
import 'package:vendingsavvy/services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await LocalStorage().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Adjust based on your design
      minTextAdapt: true,
      splitScreenMode: true, // Ensure this matches your needs
      builder: (BuildContext context, child) {
        return GetMaterialApp(
          initialBinding: AppBindings(),
          debugShowCheckedModeBanner: false,
          title: 'vendingsavvy',
          defaultTransition: Transition.cupertino,
          getPages: AppRouters.routes,
          initialRoute: RouteConstants.splashscreen,
        );
      },
    );
  }
}
