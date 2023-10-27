import 'package:amanat_kilat_semesta/features/cutomer_services/page/customer_services.dart';
import 'package:amanat_kilat_semesta/features/detail_pengiriman/detail_pengiriman.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/app_style.dart';
import 'core/theme/app_theme_data.dart';
import 'features/home/page/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  deviceOrientation();
  statusBarDarkStyle();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Amanat Kilat Semesta',
          debugShowCheckedModeBanner: false,
          theme: AppThemeData.getThemeLight(),
          home: child,
        );
      },
      child: const DetailPengirimanPage(),
    );
  }
}
