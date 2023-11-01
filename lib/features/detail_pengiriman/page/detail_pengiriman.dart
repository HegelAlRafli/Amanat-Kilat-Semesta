import 'dart:convert';
import 'package:amanat_kilat_semesta/core/theme/color_value.dart';
import 'package:amanat_kilat_semesta/features/detail_pengiriman/model/track_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:http/http.dart' as http;

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

    print('-----------user-------------');

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      print("response : ${response.body}");
      print('status code : ${response.statusCode}');

      if (response.statusCode == 200) {
        print(url);

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
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          elevation: 0,
          centerTitle: true,
          title: FutureBuilder(
            future: getTrack(),
        builder: (context, AsyncSnapshot<TrackModel> snapshot) {
              return
                snapshot.hasData?
                Text(
                snapshot.data!.track!.awb.toString(),
                style: textTheme.headline6!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ):
                    Text(
                '-',
                style: textTheme.headline6!.copyWith(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              );
        }
          ),
        ),
        body: FutureBuilder<TrackModel>(
            future: getTrack(),
            builder: (context, AsyncSnapshot<TrackModel> snapshot) {
              if (snapshot.hasData) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Column(
                          children: [
                          ],
                        ),
                      ),
                      Container(
                        color: ColorValue.primaryColor,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30.h,
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
                                          style: textTheme.headline6!.copyWith(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: ColorValue.primaryColor)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 29.h,
                            ),
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                      "null"
                                                  ? Text(
                                                      snapshot.data!.track!
                                                          .receiptDate
                                                          .toString(),
                                                      style: textTheme
                                                          .headline6!
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
                                                          .headline6!
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
                                              //     style: textTheme.headline6!
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
                                              //     style: textTheme.headline6!
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
                                              //     style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                                                style: textTheme.headline6!
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
                              style: textTheme.headline6!.copyWith(
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
                                          Text(""),
                                        if (snapshot.data!.data![index].date
                                                .toString() !=
                                            "null")
                                          Text(
                                            snapshot.data!.data![index].date
                                                .toString(),
                                            style: textTheme.headline6!
                                                .copyWith(
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: const Color(
                                                        0xff737373)),
                                          ),
                                        Text(
                                          snapshot.data!.data![index].time
                                              .toString(),
                                          style: textTheme.headline6!.copyWith(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
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
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
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
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).viewPadding.top,
                  color: Color(0xffED1B24),
                ),
              ],
            ),
          ),
          Container(
            color: ColorValue.primaryColor,
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
                    Shimmer.fromColors(
                      baseColor: Colors.white,
                      highlightColor: Colors.grey[300]!,
                      child: Container(
                        color: Colors.grey[300]!,
                        child: const Text("AWB-123456"),
                      ),
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 52.w, vertical: 38.h),
                    height: 160.h,
                    width: 160.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.grey[300]!,
                              child: Image.asset(
                                'assets/illustrations/pending.png',
                                color: Colors.grey[300]!,
                              ),
                            ),
                          ),
                          Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              color: Colors.grey[300]!,
                              child: Text("pending".toString().capitalize(),
                                  style: textTheme.headline6!.copyWith(
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
                SizedBox(
                  height: 29.h,
                ),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      color: Colors.grey[300]!,
                                      child: Text(
                                        "pending".toString().capitalize(),
                                        style: textTheme.headline6!.copyWith(
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
                                    style: textTheme.headline6!.copyWith(
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
                                      color: Colors.grey[300]!,
                                      child: Text(
                                        "Kota Bandung",
                                        style: textTheme.headline6!.copyWith(
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
                                    style: textTheme.headline6!.copyWith(
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
                                      color: Colors.grey[300]!,
                                      child: Text(
                                        "Kota Bandung",
                                        style: textTheme.headline6!.copyWith(
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
                                    style: textTheme.headline6!.copyWith(
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
                                      color: Colors.grey[300]!,
                                      child: Text(
                                        'Dadang Sutisna'.toUpperCase(),
                                        style: textTheme.headline6!.copyWith(
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
                                    style: textTheme.headline6!.copyWith(
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
                                      color: Colors.grey[300]!,
                                      child: Text(
                                        'Dadang Sutisna'.toUpperCase(),
                                        style: textTheme.headline6!.copyWith(
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
                  style: textTheme.headline6!.copyWith(
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
                                color: Colors.grey[300]!,
                                child: Text(
                                  "2023-10-12",
                                  style: textTheme.headline6!.copyWith(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff737373)),
                                ),
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.grey[300]!,
                                child: Text(
                                  "08.00",
                                  style: textTheme.headline6!.copyWith(
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
                            color: Colors.grey[300]!,
                            child: Text(
                              "Barang nya sudah sampai bandung",
                              style: textTheme.headline6!.copyWith(
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
