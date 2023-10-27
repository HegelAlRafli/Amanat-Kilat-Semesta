import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';
import '../../about_us/page/about_us.dart';
import '../../check_postage/page/check_postage.dart';
import '../../cutomer_services/page/customer_services.dart';
import '../widgets/box_widget.dart';
import '../widgets/search_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: transparentAppBarWidget(),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 29.h,
                  width: 81.w,
                ),
                Text(
                  "Amanah Kilat Semesta",
                  style: TextStyle(
                      fontFamily: 'Russo One',
                      fontSize: 14.sp,
                      color: ColorValue.primaryColor),
                ),
              ],
            ),
            SizedBox(height: 32.h),
            const SearchWidget(),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BoxWidget(
                  icon: "assets/icons/price_tag.svg",
                  title: "Cek Ongkir",
                  route: CheckPostagePage(),
                ),
                BoxWidget(
                  icon: "assets/icons/location.svg",
                  title: "Cek Lokasi",
                  route: Container(),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoxWidget(
                  icon: "assets/icons/about_us.png",
                  isSvg: false,
                  title: "Tentang Kami",
                  route: AboutUsPage(),
                ),
                BoxWidget(
                  icon: "assets/icons/customer_services.png",
                  isSvg: false,
                  title: "Customer Service",
                  route: CustomerServicesPages(),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
