import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/color_value.dart';

class CustomTableWidget extends StatelessWidget {
  const CustomTableWidget({super.key});

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
          dataRowMaxHeight: 40.h,
          dataRowMinHeight: 40.h,
          headingRowColor: MaterialStateColor.resolveWith((states) => ColorValue.primaryColor),
          headingTextStyle: textTheme.bodyMedium!.copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
          dataTextStyle: textTheme.bodyMedium!.copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
          dividerThickness: 0,
          border: TableBorder(horizontalInside: BorderSide(width: 1.w, color: Colors.white)),

          // Table Headers
          columns: [
            DataColumn(
                label: Text(
              'Kategori',
              style: textTheme.bodyLarge?.copyWith(color: Colors.white),
            )),
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
            DataColumn(
                label: Text(
              'Estimasi',
              style: textTheme.bodyLarge?.copyWith(color: Colors.white),
            )),
          ],

          // Data Column Table
          rows: List.generate(3, (index) {
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
                DataCell(Text('EXDHEMAT',
                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left)),
                DataCell(SizedBox(
                  width: 70.w,
                  child: Text('Rp. 999,000',
                      style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left),
                )),
                DataCell(Text('3-4 hari',
                    style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left)),
              ],
            );
          }),
        ),
      ),
    );
  }
}
