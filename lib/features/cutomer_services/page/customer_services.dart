import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';
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
      appBar: customAppbarWidget('Customer Services'),
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

