import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/color_value.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.route}) : super(key: key);
  final Widget route;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => route));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: ColorValue.primaryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lacak Paket Kamu!",
              style: textTheme.headline6?.copyWith(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Masukkan nomor pengiriman yang diberikan oleh petugas.",
              style: textTheme.bodyText2?.copyWith(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 11.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.5.r)),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/search.svg', height: 16.h, width: 16.w),
                  SizedBox(width: 16.w),
                  Text(
                    "Masukkan nomer Resi",
                    style: textTheme.bodyText2?.copyWith(
                        fontSize: 12.sp,
                        color: const Color(0XFF9B9B9B),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
