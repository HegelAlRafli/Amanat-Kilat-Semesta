import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../core/theme/color_value.dart';
import '../../../core/widgets/scroll/scroll_behavior.dart';
import '../model/track_model.dart';

class DetailPengirimanPage extends StatefulWidget {
  const DetailPengirimanPage({Key? key, required this.resi}) : super(key: key);
  final String resi;

  @override
  State<DetailPengirimanPage> createState() => _DetailPengirimanPageState();
}

class _DetailPengirimanPageState extends State<DetailPengirimanPage> {
  TrackModel? trackModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('resi : ${widget.resi}');
  }

  Future<TrackModel> getTrack() async {
    var url = 'https://sistem.amanatkilatsemesta.com/api/track/${widget.resi}';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        TrackModel model = TrackModel.fromJson(json.decode(response.body));

        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
    return TrackModel();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: ColorValue.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back_rounded, size: 24.w),
              )),
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: ColorValue.primaryColor, width: 0),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: FutureBuilder(
              future: getTrack(),
              builder: (context, AsyncSnapshot<TrackModel> snapshot) {
                return snapshot.hasData
                    ? Text(
                        snapshot.data!.track!.awb.toString(),
                        style: textTheme.displaySmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      )
                    : Text(
                        '-',
                        style: textTheme.displaySmall!.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      );
              }),
        ),
        body: FutureBuilder<TrackModel>(
            future: getTrack(),
            builder: (context, AsyncSnapshot<TrackModel> snapshot) {
              if (snapshot.hasData) {
                return ScrollConfiguration(
                  behavior: NoOverScrollEffectBehavior(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          color: ColorValue.primaryColor,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 8.h,
                              ),
                              Container(
                                padding: EdgeInsets.all(8.w),
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
                                      horizontal: 52.w, vertical: 38.h),
                                  height: 160.h,
                                  width: 160.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(
                                          'assets/illustrations/${snapshot.data!.track!.status.toString()}.png',
                                        ),
                                        Text(
                                            snapshot.data!.track!.status
                                                .toString()
                                                .capitalize(),
                                            style: textTheme.bodyLarge!.copyWith(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: ColorValue.primaryColor)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 29.h),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24.h),
                              Text(
                                "Detail Pengiriman",
                                style: textTheme.headlineMedium!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 16.h),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 118.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Status :",
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                  snapshot.data!.track!.status
                                                      .toString()
                                                      .capitalize(),
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0XFF9B9B9B)),
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
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                snapshot.data!.track!
                                                            .receiptDate !=
                                                        null
                                                    ? Text(
                                                        snapshot.data!.track!
                                                            .receiptDate
                                                            .toString(),
                                                        style: textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: const Color(
                                                                    0XFF9B9B9B)),
                                                      )
                                                    : Text("-",
                                                        style: textTheme
                                                            .bodyMedium!
                                                            .copyWith(
                                                                fontSize: 10.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: const Color(
                                                                    0XFF9B9B9B))),

                                                // if (snapshot.data!.track!
                                                //     .shippingTrackers!.isEmpty)
                                                //   Text(
                                                //     "-",
                                                //     style: textTheme.bodyMedium!
                                                //         .copyWith(
                                                //             fontSize: 10.sp,
                                                //             fontWeight:
                                                //                 FontWeight.w500,
                                                //             color: const Color(
                                                //                 0XFF9B9B9B)),
                                                //   )
                                                // else if (snapshot
                                                //         .data!
                                                //         .track!
                                                //         .shippingTrackers![0]
                                                //         .date !=
                                                //     null)
                                                //   Text(
                                                //     snapshot.data!.track!
                                                //         .shippingTrackers![0].date
                                                //         .toString(),
                                                //     style: textTheme.bodyMedium!
                                                //         .copyWith(
                                                //             fontSize: 10.sp,
                                                //             fontWeight:
                                                //                 FontWeight.w500,
                                                //             color: const Color(
                                                //                 0XFF9B9B9B)),
                                                //   )
                                                // else
                                                //   Text(
                                                //     "-",
                                                //     style: textTheme.bodyMedium!
                                                //         .copyWith(
                                                //             fontSize: 10.sp,
                                                //             fontWeight:
                                                //                 FontWeight.w500,
                                                //             color: const Color(
                                                //                 0XFF9B9B9B)),
                                              ],
                                            ),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 118.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Asal :",
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                  snapshot
                                                      .data!.track!.kotaAsal!.name
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0XFF9B9B9B)),
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
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                  snapshot.data!.track!
                                                      .kotaTujuan!.name
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0XFF9B9B9B)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ]),
                                    SizedBox(
                                      height: 16.h,
                                    ),
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 118.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Nama Pengirim :",
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                  snapshot
                                                      .data!.track!.customer!.name
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0XFF9B9B9B)),
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
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                ),
                                                SizedBox(
                                                  height: 4.h,
                                                ),
                                                Text(
                                                  snapshot.data!.track!.recipient
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: textTheme.bodyMedium!
                                                      .copyWith(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: const Color(
                                                              0XFF9B9B9B)),
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
                                style: textTheme.headlineMedium!.copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.data!.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return TimelineTile(
                                    alignment: TimelineAlign.manual,
                                    lineXY: 0.34.w,
                                    isFirst: index == 0,
                                    isLast:
                                        index == snapshot.data!.data!.length - 1,
                                    afterLineStyle: LineStyle(
                                        color: ColorValue.primaryColor,
                                        thickness: 2.w),
                                    hasIndicator: true,
                                    beforeLineStyle: LineStyle(
                                        color: ColorValue.primaryColor,
                                        thickness: 2.w),
                                    indicatorStyle: IndicatorStyle(
                                      padding: EdgeInsets.zero,
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
                                      padding: EdgeInsets.only(
                                        right: 27.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          if (snapshot.data!.data![index].date
                                                  .toString() ==
                                              "null")
                                            const Text(""),
                                          if (snapshot.data!.data![index].date
                                                  .toString() !=
                                              "null")
                                            Text(
                                              snapshot.data!.data![index].date
                                                  .toString(),
                                              style: textTheme.bodyMedium!
                                                  .copyWith(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w500,
                                                      color: const Color(
                                                          0xff737373)),
                                            ),
                                          Text(
                                            snapshot.data!.data![index].time
                                                .toString(),
                                            style: textTheme.bodyMedium!.copyWith(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          )
                                        ],
                                      ),
                                    ),
                                    endChild: Container(
                                      padding: EdgeInsets.only(
                                          left: 27.w, bottom: 24.h),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.data![index].notes
                                                .toString()
                                                .capitalize(),
                                            style: textTheme.bodyMedium!.copyWith(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
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
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text("Error"),
                );
              } else {
                return _loading();
              }
            }),
      ),
    );
  }

  Widget _loading() {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: ColorValue.primaryColor,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  padding: EdgeInsets.all(8.w),
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
                        horizontal: 52.w, vertical: 38.h),
                    height: 160.h,
                    width: 160.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration:  BoxDecoration(
                                color: Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Image.asset(
                                'assets/illustrations/pending.png',
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              decoration:  BoxDecoration(
                                color: Colors.grey[300]!,
                                borderRadius: BorderRadius.circular(5.r),
                              ),

                              child: Text(
                                  "pending"
                                      .toString()
                                      .capitalize(),
                                  style: textTheme.bodyMedium!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorValue.primaryColor)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 29.h),
              ],
            ),
          ),
          Container(
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
                  style: textTheme.headlineMedium!.copyWith(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Status :",
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300]!,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.r),
                                        ),
                                      ),
                                      child: Text(
                                        "pending".toString().capitalize(),
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 118.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tanggal Diterima :",
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Text(
                                    "-",
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0XFF9B9B9B)),
                                  )
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Asal :",
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300]!,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.r),
                                        ),
                                      ),
                                      child: Text(
                                        "Kota Bandung",
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 118.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tujuan :",
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300]!,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.r),
                                        ),
                                      ),
                                      child: Text(
                                        "Kota Bandung",
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Pengirim :",
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300]!,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.r),
                                        ),
                                      ),
                                      child: Text(
                                        'Dadang Sutisna'.toUpperCase(),
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 118.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Nama Penerima :",
                                    style: textTheme.bodyMedium!.copyWith(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300]!,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5.r),
                                        ),
                                      ),
                                      child: Text(
                                        'Dadang Sutisna'.toUpperCase(),
                                        style: textTheme.bodyMedium!.copyWith(
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.w500,
                                            color: const Color(0XFF9B9B9B)),
                                      ),
                                    ),
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
                  style: textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 24.h,
                ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TimelineTile(
                      alignment: TimelineAlign.manual,
                      lineXY: 0.34.w,
                      isFirst: index == 0,
                      isLast: index == 2,
                      afterLineStyle: LineStyle(
                          color: ColorValue.primaryColor, thickness: 2.w),
                      hasIndicator: true,
                      beforeLineStyle: LineStyle(
                          color: ColorValue.primaryColor, thickness: 2.w),
                      indicatorStyle: IndicatorStyle(
                        padding: EdgeInsets.zero,
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
                        padding: EdgeInsets.only(
                          right: 27.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300]!,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  "2023-10-12",
                                  style: textTheme.bodyMedium!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff737373)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300]!,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5.r),
                                  ),
                                ),
                                child: Text(
                                  "08.00",
                                  style: textTheme.bodyMedium!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff737373)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      endChild: Container(
                        padding: EdgeInsets.only(left: 27.w, bottom: 16.h),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300]!,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.r),
                              ),
                            ),
                            child: Text(
                              "Barang nya sudah sampai bandung",
                              style: textTheme.bodyMedium!.copyWith(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff737373)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
