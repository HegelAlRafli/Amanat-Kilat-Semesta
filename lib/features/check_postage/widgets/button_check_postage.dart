import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/postage_model.dart';
import 'custom_table_widget.dart';
import 'loading_table_widget.dart';

import 'package:http/http.dart' as http;

class CheckPostageButtonWidget extends StatefulWidget {
  const CheckPostageButtonWidget({
    super.key,
    required this.idOrigin,
    required this.idDestination,
  });

  final String idOrigin, idDestination;

  @override
  State<CheckPostageButtonWidget> createState() => _CheckPostageButtonWidgetState();
}

class _CheckPostageButtonWidgetState extends State<CheckPostageButtonWidget> {
  PostageModel? model;

  List listDestinationLocations = [];
  List listOriginLocations = [];

  String status = 'initiate';

  void _fetchApi(String from, to) async {
    setState(() {
      status = 'fetch';
    });

    final response = await http.get(
        Uri.parse("https://sistem.amanatkilatsemesta.com/api/rate/$from/$to"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        });

    model = PostageModel.fromJson(json.decode(response.body.toString()));

    if (response.statusCode == 200) {
      setState(() {
        status = 'hasData';
      });
    } else {
      setState(() {
        status = 'error';
      });
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        ElevatedButton(
          onPressed: (widget.idOrigin != '' && widget.idDestination != '')
              ? () {
                  _fetchApi(widget.idOrigin, widget.idDestination);
                }
              : null,
          child: const Text('Cek Ongkir'),
        ),
        status == 'initiate'
            ? const SizedBox()
            : status == 'fetch'
                ? Column(
                    children: [
                      SizedBox(height: 32.h),
                      const LoadingTablePostageWidget(),
                    ],
                  )
                : status == 'hasData'
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 32.h),
                          model!.rate.isEmpty
                              ? Text('Tidak ada data untuk ${model!.asal} Tujuan ${model!.tujuan}')
                              : Text('Ongkos Kirim dari ${model!.asal} Ke ${model!.tujuan} :',
                                  style: textTheme.bodyLarge?.copyWith(color: Colors.black)),
                          SizedBox(height: 16.h),
                          model!.rate.isEmpty
                              ? const SizedBox()
                              : TablePostageWidget(model: model!),
                          SizedBox(height: 40.h),
                        ],
                      )
                    : Column(
                        children: [
                          SizedBox(height: 32.h),
                          const Text('Server Error')
                        ],
                      )
      ],
    );
  }
}
