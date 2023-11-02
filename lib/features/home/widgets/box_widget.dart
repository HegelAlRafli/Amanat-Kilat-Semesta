import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BoxWidget extends StatelessWidget {
  const BoxWidget(
      {Key? key,
      required this.icon,
      required this.title,
      required this.route,
      this.isSvg = true})
      : super(key: key);

  final String icon;
  final String title;
  final Widget route;
  final bool? isSvg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => route));
      },
      child: Container(
        width: 150.w,
        height: 155.h,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0XFF9B9B9B).withOpacity(1)),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            isSvg == true
                ? SvgPicture.asset(icon, height: 50.h, width: 50.w)
                : Image.asset(icon, height: 50.h, width: 50.w),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 12.sp,
                  color: const Color(0XFF737373),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
