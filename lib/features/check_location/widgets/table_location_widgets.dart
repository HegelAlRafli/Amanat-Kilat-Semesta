import 'package:amanat_kilat_semesta/features/check_location/model/check_location_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/color_value.dart';

class TableLocationWidget extends StatelessWidget {
  final CheckLocationModel checkLocationModel;
  const TableLocationWidget({super.key, required this.checkLocationModel});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF2F2F4)),
        borderRadius: BorderRadius.only(topRight: Radius.circular(7.5.r), topLeft: Radius.circular(7.5.r)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(7.5.r), topLeft: Radius.circular(7.5.r)),
        child: DataTable(
          showCheckboxColumn: false,
          horizontalMargin: 16.w,
          columnSpacing: 45.w,
          headingRowHeight: 42.w,
          dataRowMaxHeight: double.infinity,
          dataRowMinHeight: 40.h,
          headingRowColor: MaterialStateColor.resolveWith((states) => ColorValue.primaryColor),
          headingTextStyle: textTheme.bodyLarge?.copyWith(color: Colors.white),
          dataTextStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
          dividerThickness: 0,
          border: TableBorder(horizontalInside: BorderSide(width: 1.w, color: Colors.white)),

          // Table Headers
          columns: const [
            DataColumn(label: Text('Kota')),
            DataColumn(label: Text('Alamat')),
          ],

          // Data Column Table
          rows: List.generate(checkLocationModel.data!.length, (index) {
            Color rowColor = index.isEven ? Colors.white : ColorValue.backgroundColor;
            return DataRow(
              color: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return rowColor.withOpacity(0);
                  }
                  return rowColor;
                },
              ),
              cells: [
                DataCell(Padding(
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  child:  Text(checkLocationModel!.data![index].city!, textAlign: TextAlign.left),
                )),
                DataCell(Padding(
                  padding: EdgeInsets.fromLTRB(0, 13.h, 16.w, 13.h),
                  child:  Text(checkLocationModel!.data![index].address!, textAlign: TextAlign.left),
                )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
class TableLocationLoadingWidget extends StatelessWidget {
  const TableLocationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFF2F2F4)),
        borderRadius: BorderRadius.only(topRight: Radius.circular(7.5.r), topLeft: Radius.circular(7.5.r)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(topRight: Radius.circular(7.5.r), topLeft: Radius.circular(7.5.r)),
        child: DataTable(
          showCheckboxColumn: false,
          horizontalMargin: 16.w,
          columnSpacing: 45.w,
          headingRowHeight: 42.w,
          dataRowMaxHeight: double.infinity,
          dataRowMinHeight: 40.h,
          headingRowColor: MaterialStateColor.resolveWith((states) => ColorValue.primaryColor),
          headingTextStyle: textTheme.bodyLarge?.copyWith(color: Colors.white),
          dataTextStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
          dividerThickness: 0,
          border: TableBorder(horizontalInside: BorderSide(width: 1.w, color: Colors.white)),

          // Table Headers
          columns: const [
            DataColumn(label: Text('Kota')),
            DataColumn(label: Text('Alamat')),
          ],

          // Data Column Table
          rows: List.generate(4, (index) {
            Color rowColor = index.isEven ? Colors.white : ColorValue.backgroundColor;
            return DataRow(
              color: MaterialStateColor.resolveWith(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return rowColor.withOpacity(0);
                  }
                  return rowColor;
                },
              ),
              cells: [
                DataCell(Padding(
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  child:  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                        color: Colors.grey[300]!,
                    child: Text("asdd", textAlign: TextAlign.left)),
                  ),
                )),
                DataCell(Padding(
                  padding: EdgeInsets.fromLTRB(0, 13.h, 16.w, 13.h),
                  child:  Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                          color: Colors.grey[300]!,
                          child: Text("asddsksaasssd", textAlign: TextAlign.left))),
                )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
