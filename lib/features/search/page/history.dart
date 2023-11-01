import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../sqflite/database_helper.dart';
import '../../detail_pengiriman/page/detail_pengiriman.dart';


class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final SearchHistoryDatabase _database = SearchHistoryDatabase();
  List<String> searchHistory = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSearchHistory();
  }

  void _loadSearchHistory() async {
    final history = await _database.getSearchHistory();
    setState(() {
      searchHistory = history.reversed.toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              height: kToolbarHeight,
              width: double.infinity,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/arrow-back.svg',
                      height: 24.h,
                      width: 24.w,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              itemCount: searchHistory.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  child: Row(children: [
                    SvgPicture.asset("assets/icons/history.svg", height: 24.h, width: 24.w,),
                    SizedBox(width: 16.w,),
                    InkWell(
                      onTap: () {
                        //close keyboard

                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPengirimanPage(resi: searchHistory[index],),));
                      },
                      child: Text(searchHistory[index],
                        style: textTheme.bodyText2?.copyWith(
                          fontSize: 14.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),),
                    ),
                    const Spacer(),
                  ],),
                );
              },),

          ],
        ),
      ),
    );
  }
}
