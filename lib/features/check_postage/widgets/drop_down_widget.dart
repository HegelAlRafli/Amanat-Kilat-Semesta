import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';
import '../model/rate_model.dart';
import 'button_check_postage.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    super.key,
    required this.listDestinationLocations,
    required this.listOriginLocations,
    required this.data,
  });

  final List listDestinationLocations, listOriginLocations;
  final RateModel data;

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  String? selectedOriginLocation;
  String? selectedDestinationLocation;

  int? indexOrigin;
  int? indexDestination;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        Text('Asal Pengiriman', style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
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
              selectedOriginLocation = newValue.toString();
              indexOrigin = widget.listOriginLocations.indexOf(selectedOriginLocation);
            });
          },
          items: widget.listOriginLocations.map((location) {
            return DropdownMenuItem(
              value: location,
              child: Text(location),
            );
          }).toList(),
        ),
        SizedBox(height: 16.h),
        Text('Tujuan Pengiriman', style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
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
              selectedDestinationLocation = newValue.toString();
              indexDestination = widget.listDestinationLocations.indexOf(selectedDestinationLocation);
            });
          },
          items: widget.listDestinationLocations.map((location) {
            return DropdownMenuItem(
              value: location,
              child: Text(location),
            );
          }).toList(),
        ),
        SizedBox(height: 24.h),
        CheckPostageButtonWidget(
            idOrigin: indexOrigin == null
                ? ''
                : widget.data.from[indexOrigin!].id.toString(),
            idDestination: indexDestination == null
                ? ''
                : widget.data.to[indexDestination!].id.toString())
      ],
    );
  }
}
