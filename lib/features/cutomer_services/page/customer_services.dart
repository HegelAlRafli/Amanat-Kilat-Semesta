import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../widgets/custom_form_widget.dart';

class CustomerServicesPages extends StatefulWidget {
  const CustomerServicesPages({super.key});

  @override
  State<CustomerServicesPages> createState() => _CustomerServicesPagesState();
}

class _CustomerServicesPagesState extends State<CustomerServicesPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 24.w,
        leading: Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 24.w,
            )),
        title: const Text('Tentang Kami'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Image.asset('assets/images/logo.png', height: 75.h),
            SizedBox(height: 16.h),
            Text('Amanah Kilat Semesta',
                style: TextStyle(
                    fontFamily: 'Russo One',
                    fontSize: 14.sp,
                    color: ColorValue.primaryColor)),
            SizedBox(height: 40.h),
            const CustomFormWidget(),
          ],
        ),
      ),
    );
  }
}
