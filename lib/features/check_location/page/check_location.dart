import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';
import '../../../core/widgets/scroll/scroll_behavior.dart';
import '../model/check_location_model.dart';
import '../widgets/table_location_widgets.dart';

class CheckLocationPage extends StatefulWidget {
  const CheckLocationPage({super.key});

  @override
  State<CheckLocationPage> createState() => _CheckLocationPageState();
}

class _CheckLocationPageState extends State<CheckLocationPage> {
  List locationList = [];
  String? selectedOriginLocation;

  Future<CheckLocationModel> getCheckLocation() async {
    var url = 'https://sistem.amanatkilatsemesta.com/api/location';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        CheckLocationModel model = CheckLocationModel.fromJson(json.decode(response.body));
        locationList = model.data!.map((e) => e.city).toList();
        return model;
      } else {
        throw Exception("Failed to fetch data from API");
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception("Failed to fetch data from API");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbarWidget(context, 'Cek Lokasi'),
      body: ScrollConfiguration(
        behavior: NoOverScrollEffectBehavior(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: FutureBuilder<CheckLocationModel>(
              future: getCheckLocation(),
              builder: (context, AsyncSnapshot<CheckLocationModel> snapshot) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      snapshot.hasData
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16.h),
                                TableLocationWidget(checkLocationModel: snapshot.data!)
                              ],
                            )
                          : Column(
                              children: [
                                SizedBox(height: 16.h),
                                TableLocationLoadingWidget()
                              ],
                            ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
