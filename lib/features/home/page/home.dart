import 'package:amanat_kilat_semesta/core/theme/color_value.dart';
import 'package:amanat_kilat_semesta/features/home/widgets/box_widget.dart';
import 'package:amanat_kilat_semesta/features/home/widgets/lacak_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo.png', height: 29.h, width: 81.w,),
                Text("Amanah Kilat Semesta",
                  style: TextStyle(
                    fontFamily: 'Russo One',
                    fontSize: 14.sp,
                    color: ColorValue.primaryColor
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.h,),
            const LacakSearchWidget(),
            SizedBox(height: 29.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoxWidget(icon: "assets/icons/price_tag.svg", title: "Cek Ongkir", route: Container(),),
                BoxWidget(icon: "assets/icons/location.svg", title: "Cek Lokasi", route: Container(),),
              ],
            ),
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoxWidget(icon: "assets/icons/person_info.svg", title: "Tentang Kami", route: Container(),),
                BoxWidget(icon: "assets/icons/person_service.svg", title: "Customer Service", route: Container(),),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
