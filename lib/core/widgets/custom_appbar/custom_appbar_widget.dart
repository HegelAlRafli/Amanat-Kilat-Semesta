import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppbarWidget(String title) {
  return AppBar(
    titleSpacing: 24.w,
    leading: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: Icon(
          Icons.arrow_back_rounded,
          size: 24.w,
        )),
    title: Text(title),
  );
}
