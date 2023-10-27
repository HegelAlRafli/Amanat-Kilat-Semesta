import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_style.dart';

AppBar customAppbarWidget(BuildContext context, String title) {
  return AppBar(
    titleSpacing: 24.w,
    leading: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_rounded, size: 24.w),
        )),
    title: Text(title),
  );
}

PreferredSize transparentAppBarWidget({bool isDarkStyle = true}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(0),
    child: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: isDarkStyle ? systemUiOverlayDarkStyle : systemUiOverlayLightStyle
    ),
  );
}
