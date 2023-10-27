import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';
import '../../../core/widgets/scroll/scroll_behavior.dart';
import '../widgets/custom_table_widget.dart';

class CheckPostagePage extends StatefulWidget {
  const CheckPostagePage({super.key});

  @override
  State<CheckPostagePage> createState() => _CheckPostagePageState();
}

class _CheckPostagePageState extends State<CheckPostagePage> {
  bool isVisible = false;

  String? selectedOriginLocation;
  List<String> listOriginLocations = [
    "Semarang",
    "Surakarta (Solo)",
    "Yogyakarta",
    "Magelang",
    "Pekalongan",
    "Tegal",
    "Purwokerto",
    "Purworejo",
    "Kendal",
    "Kebumen"
  ];

  String? selectedDestinationLocation;
  List<String> listDestinationLocations = [
    "Semarang",
    "Surakarta (Solo)",
    "Yogyakarta",
    "Magelang",
    "Pekalongan",
    "Tegal",
    "Purwokerto",
    "Purworejo",
    "Kendal",
    "Kebumen"
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
        appBar: customAppbarWidget(context, 'Cek Ongkir'),
        body: ScrollConfiguration(
          behavior: NoOverScrollEffectBehavior(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),
                  Text('Asal Pengiriman',
                      style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
                  SizedBox(height: 8.h),
                  DropdownButtonFormField(
                    isDense: true,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(7.5.r),
                    icon: const Icon(Icons.arrow_drop_down_rounded, color: ColorValue.greyColor),
                    iconSize: 24.w,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                    style: textTheme.bodyLarge?.copyWith(
                        color: ColorValue.secondaryGreyColor,
                        fontWeight: FontWeight.w400),
                    hint: Text(selectedOriginLocation ?? 'Pilih Lokasi'),
                    value: selectedOriginLocation,
                    onChanged: (newValue) {
                      setState(() {
                        selectedOriginLocation = newValue;
                      });
                    },
                    items: listOriginLocations.map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.h),
                  Text('Tujuan Pengiriman',
                      style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
                  SizedBox(height: 8.h),
                  DropdownButtonFormField(
                    isDense: true,
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(7.5.r),
                    icon: const Icon(Icons.arrow_drop_down_rounded, color: ColorValue.greyColor),
                    iconSize: 24.w,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                        borderRadius: BorderRadius.circular(7.5.r),
                      ),
                    ),
                    style: textTheme.bodyLarge?.copyWith(
                        color: ColorValue.secondaryGreyColor,
                        fontWeight: FontWeight.w400),
                    hint: Text(selectedDestinationLocation ?? 'Pilih Lokasi'),
                    value: selectedDestinationLocation,
                    onChanged: (newValue) {
                      setState(() {
                        selectedDestinationLocation = newValue;
                      });
                    },
                    items: listDestinationLocations.map((location) {
                      return DropdownMenuItem(
                        value: location,
                        child: Text(location),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 24.h),
                  ElevatedButton(
                    onPressed: (selectedOriginLocation != null && selectedDestinationLocation != null)
                        ? () {
                            setState(() {
                              isVisible = true;
                            });
                          }
                        : null,
                    child: const Text('Cek Ongkir'),
                  ),
                  SizedBox(height: 24.h),
                  Visibility(
                    visible: isVisible,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Ongkos Kirim dari $selectedOriginLocation Ke $selectedDestinationLocation :',
                            style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
                        SizedBox(height: 16.h),
                        const TablePostageWidget(),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
