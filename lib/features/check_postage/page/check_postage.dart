import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';
import '../../../core/widgets/loading/loading_widget.dart';
import '../../../core/widgets/scroll/scroll_behavior.dart';
import '../model/rate_model.dart';
import '../widgets/drop_down_widget.dart';

class CheckPostagePage extends StatefulWidget {
  const CheckPostagePage({super.key});

  @override
  State<CheckPostagePage> createState() => _CheckPostagePageState();
}

class _CheckPostagePageState extends State<CheckPostagePage> {
  List listDestinationLocations = [];

  List listOriginLocations = [];

  Future<RateModel> _getLocation() async {
    final response = await http
        .get(Uri.parse('https://sistem.amanatkilatsemesta.com/api/rate'));

    if (response.statusCode == 200) {
      RateModel model = RateModel.fromJson(json.decode(response.body));
      listOriginLocations = model.from.map((e) => e.name).toList();
      listDestinationLocations = model.to.map((e) => e.name).toList();

      return model;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppbarWidget(context, 'Cek Ongkir'),
        body: FutureBuilder<RateModel>(
          future: _getLocation(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(child: Text('Tidak ada koneksi internet'));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget(isOnePage: true);
            } else {
              return ScrollConfiguration(
                behavior: NoOverScrollEffectBehavior(),
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropDownWidget(
                            listDestinationLocations: listDestinationLocations,
                            listOriginLocations: listOriginLocations,
                            data: snapshot.data!),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        ));
  }
}
