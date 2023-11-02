import 'dart:convert';

import 'package:amanat_kilat_semesta/features/check_location/model/check_location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;
import '../../../core/theme/color_value.dart';
import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';
import '../../../core/widgets/scroll/scroll_behavior.dart';
import '../widgets/table_location_widgets.dart';

import 'package:http/http.dart' as http;


class CheckLocationPage extends StatefulWidget {
  const CheckLocationPage({super.key});

  @override
  State<CheckLocationPage> createState() => _CheckLocationPageState();
}

class _CheckLocationPageState extends State<CheckLocationPage> {
  bool isVisible = false;
  List locationList = [];

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

  // Future<TrackModel> getTrack() async {
  //   var url = 'https://sistem.amanatkilatsemesta.com/api/track/${widget.resi}';
  //
  //   print('-----------user-------------');
  //
  //   try {
  //     final response = await http.get(
  //       Uri.parse(url),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //       },
  //     );
  //     print("response : ${response.body}");
  //     print('status code : ${response.statusCode}');
  //
  //     if (response.statusCode == 200) {
  //       print(url);
  //
  //       TrackModel model = TrackModel.fromJson(json.decode(response.body));
  //
  //       return model;
  //     } else {
  //       throw Exception("Failed to fetch data from API");
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return TrackModel();
  // }
  Future<CheckLocationModel> getCheckLocation() async {
    var url = 'https://sistem.amanatkilatsemesta.com/api/location';

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

        CheckLocationModel model = CheckLocationModel.fromJson(json.decode(response.body));
        // setState(() {
          locationList = model.data!.map((e) => e.city).toList();
        // });

        return model;
      }else{
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception("Failed to fetch data from API");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: customAppbarWidget(context, 'Cek Lokasi'),
      body: ScrollConfiguration(
        behavior: NoOverScrollEffectBehavior(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder<CheckLocationModel>(
            future: getCheckLocation(),
            builder: (context,AsyncSnapshot<CheckLocationModel> snapshot) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // SizedBox(height: 24.h),
                    // Text('Cari Lokasi Delivery Express', style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
                    // SizedBox(height: 8.h),
                    // DropdownButtonFormField(
                    //   isDense: true,
                    //   isExpanded: true,
                    //   focusColor: Colors.amber,
                    //   borderRadius: BorderRadius.circular(7.5.r),
                    //   icon: const Icon(Icons.arrow_drop_down_rounded, color: ColorValue.greyColor),
                    //   iconSize: 24.w,
                    //   decoration: InputDecoration(
                    //     enabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                    //       borderRadius: BorderRadius.circular(7.5.r),
                    //     ),
                    //     disabledBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                    //       borderRadius: BorderRadius.circular(7.5.r),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(width: 1.w, color: ColorValue.borderColor),
                    //       borderRadius: BorderRadius.circular(7.5.r),
                    //     ),
                    //   ),
                    //   style: textTheme.bodyLarge?.copyWith(
                    //       color: ColorValue.secondaryGreyColor,
                    //       fontWeight: FontWeight.w400),
                    //   hint: Text(selectedOriginLocation ?? 'Pilih Lokasi'),
                    //   value: selectedOriginLocation,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       selectedOriginLocation = newValue.toString();
                    //     });
                    //   },
                    //   items:  locationList.toSet( ).map((location){
                    //     return DropdownMenuItem(
                    //       value: location,
                    //       child: Text(
                    //         location.toString()
                    //       ),
                    //     );
                    //   }).toList(),
                    // ),
                    // SizedBox(height: 24.h),
                    // ElevatedButton(
                    //   onPressed: (selectedOriginLocation != null)
                    //       ? () {
                    //           setState(() {
                    //             isVisible = true;
                    //           });
                    //         }
                    //       : null,
                    //   child: const Text('Cek Lokasi'),
                    // ),
                    // SizedBox(height: 32.h),
                    snapshot.hasData ?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //     'Lokasi Delivery Express di $selectedOriginLocation :',
                        //     style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
                        SizedBox(height: 16.h),
                        TableLocationWidget(checkLocationModel: snapshot.data!)
                      ],
                    )
                        : Column(
                          children: [
                            SizedBox(height: 16.h),
                            TableLocationLoadingWidget(),
                          ],
                        ),

                  ],
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}
