import 'package:amanat_kilat_semesta/core/theme/color_value.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DetailPengirimanPage extends StatefulWidget {
  const DetailPengirimanPage({Key? key}) : super(key: key);

  @override
  State<DetailPengirimanPage> createState() => _DetailPengirimanPageState();
}

class _DetailPengirimanPageState extends State<DetailPengirimanPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: ColorValue.primaryColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => Navigator.pop(context),
                          child: SvgPicture.asset(
                            'assets/icons/arrow-back.svg',
                            width: 24.w,
                            height: 24.h,
                          )),
                      Text(
                        "J092HDUE03DJIJ32",
                        style: textTheme.headline6!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow-back.svg',
                        width: 24.w,
                        height: 24.h,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.white,
                        width: 3.w,
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 55.w, vertical: 38.h),
                      height: 160.h,
                      width: 160.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/illustrations/pickup.png',
                              width: 50.w,
                              height: 50.h,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text("Pick Up",
                                style: textTheme.headline6!.copyWith(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorValue.primaryColor)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 29.h,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Detail Pengiriman",
                      style: textTheme.headline6!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: const Color(0XFF9B9B9B).withOpacity(1),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 118.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Status :",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        "Pick Up",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 118.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tanggal Diterima :",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        "-",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 118.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Asal :",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        "Kota Jakarta Selatan".toUpperCase(),
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 118.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tujuan :",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        "Kota Bandar Lampung".toUpperCase(),
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 16.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 118.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama Pengirim :",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        "PT ASURANSI JASARAHARJA PUTERA"
                                            .toUpperCase(),
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 118.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nama Penerima :",
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 4.h,
                                      ),
                                      Text(
                                        "Dadang Sumedang".toUpperCase(),
                                        style: textTheme.headline6!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      "Tracking :",
                      style: textTheme.headline6!.copyWith(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return TimelineTile(
                          alignment: TimelineAlign.manual,
                          lineXY: 0.34.w,
                          isFirst: index == 0,
                          isLast: index == 0,
                          afterLineStyle: LineStyle(
                              color: ColorValue.primaryColor, thickness: 2.w),
                          hasIndicator: true,
                          beforeLineStyle: LineStyle(
                              color: ColorValue.primaryColor, thickness: 2.w),
                          indicatorStyle: IndicatorStyle(
                            height: 11.h,
                            width: 11.w,
                            color: index == 0
                                ? ColorValue.primaryColor
                                : const Color(0XFF9B9B9B),
                            indicator: index == 0
                                ? Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: index == 0
                                          ? ColorValue.primaryColor
                                          : const Color(0XFF9B9B9B),
                                    ),
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0XFF9B9B9B),
                                    ),
                                  ),
                          ),
                          startChild: Container(
                            padding: EdgeInsets.only(right: 27.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "23 Sep 2023",
                                  style: textTheme.headline6!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                                Text(
                                  "08:30",
                                  style: textTheme.headline6!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                          endChild: Container(
                            padding: EdgeInsets.only(left: 27.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sudah diambil kurir, Paket telah diproses di Semarang Drop Point oleh Fnc Eka Septiana",
                                  style: textTheme.headline6!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff737373)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
