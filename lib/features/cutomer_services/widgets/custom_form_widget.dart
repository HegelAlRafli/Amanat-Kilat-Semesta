import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/theme/color_value.dart';

class CustomFormWidget extends StatefulWidget {
  const CustomFormWidget({super.key});

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _customForm(
          context: context,
          title: 'Nomer Telepon',
          content: '(021) 87711707',
          icon: 'phone',
          onPressed: () async {
            Uri uri = Uri.parse('tel: (021) 87711707');
            if (!await launchUrl(uri)) {
              debugPrint("Could not launch the uri"); // because the simulator doesn't has the phone app
            }
          },
        ),
        _customForm(
          context: context,
          title: 'WhatsApp',
          content: '081282976820',
          icon: 'whatsapp',
          onPressed: () {
            launchUrl(
              Uri.parse('http://wa.me/+6281282976820'),
              mode: LaunchMode.externalApplication,
            );
          },
        ),
        _customForm(
          context: context,
          title: 'Gmail',
          content: 'admin@amanatkilatsemesta.com',
          icon: 'gmail',
          onPressed: () async {
            Uri uri = Uri.parse(
              'mailto:admin@amanatkilatsemesta.com?subject=&body=',
            );
            if (!await launchUrl(uri)) {
              debugPrint("Could not launch the uri");
            }
          },
        ),
        _customForm(
          context: context,
          title: 'Alamat',
          content: 'Jl. Taruna Jaya No. 95, Cibubur, Jakarta Timur',
        ),
      ],
    );
  }
}

Widget _customForm({required BuildContext context, required final String title, content, String icon = '', Function()? onPressed}) {
  final textTheme = Theme.of(context).textTheme;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
      SizedBox(height: 8.h),
      InkWell(
        onTap: onPressed,
        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5.r)),
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
            decoration: BoxDecoration(
                border: Border.all(color: ColorValue.borderColor),
                borderRadius: BorderRadius.circular(7.5.r)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 245.w,
                  child: Text(
                    content,
                    style: textTheme.bodyLarge?.copyWith(
                        color: ColorValue.secondaryGreyColor,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                icon == ''
                    ? const SizedBox()
                    : SvgPicture.asset('assets/icons/$icon.svg')
              ],
            )),
      ),
      SizedBox(height: 16.h),
    ],
  );
}
