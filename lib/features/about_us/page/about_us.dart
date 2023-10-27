import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: customAppbarWidget(context, 'Tentang Kami'),
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
            SizedBox(height: 32.h),
            Text(
              'PT Amanat Kilat Semesta adalah perusahaan logistik yang terkemuka, menyediakan solusi pengirimancepat dan andal untuk memenuhi kebutuhan bisnis Anda.\n\nDengan pengalaman bertahun-tahun dalam industri ini, kami telah membangun reputasi sebagai mitra logistik terpercaya di pasar.Visi kami adalah menjadi pilihan utama bagi pelanggan yang mencari solusi pengiriman yang efisien dan hemat biaya. Kami berkomitmen untuk menyediakan layanan terbaik dengan fokus pada kecepatan, kehandalan, dan kepuasan pelanggan.\n \nTerima kasih atas minat Anda dalam PT Amanat Kilat Semesta.\n\nHubungi kami sekarang untuk mengetahui lebih lanjut tentang layanan kami dan bagaimana kami dapat membantu memenuhi kebutuhan logistik Anda.',
              style: textTheme.bodyLarge?.copyWith(
                  color: ColorValue.secondaryGreyColor,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
      ),
    );
  }
}
