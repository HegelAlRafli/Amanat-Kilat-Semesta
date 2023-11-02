import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoConnectionPage extends StatelessWidget {
  const NoConnectionPage({
    super.key,
    required this.onPressed,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/illustrations/disconnected.png',
                  height: 128.h, width: 128.w),
              SizedBox(height: 24.h),
              Text('Tidak ada koneksi internet',
                  style: textTheme.headlineMedium?.copyWith(fontSize: 16.sp)),
              SizedBox(height: 16.h),
              Text('Sepertinya anda sedang offline, periksa koneksi internet anda, dan coba lagi.',
                  style: textTheme.bodyLarge,
                  textAlign: TextAlign.center),
              SizedBox(height: 40.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 44.h)),
                  onPressed: () {
                    onPressed;
                  },
                  child: Text('Muat Ulang'))
            ],
          ),
        ),
      ),
    );
  }
}
