import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';

class TablePostageWidget extends StatelessWidget {
  const TablePostageWidget({super.key});

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
          headingRowHeight: 42.w,
          columnSpacing: 1.w,
          dataRowMaxHeight: double.infinity,
          dataRowMinHeight: 40.h,
          headingRowColor: MaterialStateColor.resolveWith((states) => ColorValue.primaryColor),
          headingTextStyle: textTheme.bodyLarge?.copyWith(color: Colors.white),
          dataTextStyle: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
          dividerThickness: 0,
          border: TableBorder(horizontalInside: BorderSide(width: 1.w, color: Colors.white)),

          // Table Headers
          columns: [
            const DataColumn(
                label: Text('Kategori')),
            DataColumn(
                label: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Tarif',
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white),
                  ),
                  TextSpan(
                    text: '(\/Kg)',
                    style: textTheme.bodyLarge?.copyWith(color: Colors.white, fontSize: 8.sp),
                  ),
                ],
              ),
            )),
            const DataColumn(label: Text('Estimasi')),
          ],

          // Data Column Table
          rows: List.generate(14, (index) {
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
                DataCell(SizedBox(
                  width: 120.w,
                  child: const Text('EXDHEMAT', textAlign: TextAlign.left),
                )),
                DataCell(Padding(
                  padding: EdgeInsets.symmetric(vertical: 13.h),
                  child: SizedBox(
                    width: 80.w,
                    child: const Text('Rp. 21,999', textAlign: TextAlign.left),
                  ),
                )),
                DataCell(SizedBox(
                  width: 75.w,
                  child: const Text('1-4 hari', textAlign: TextAlign.left),
                )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
