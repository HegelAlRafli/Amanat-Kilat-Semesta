import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/widgets/custom_appbar/custom_appbar_widget.dart';
import '../../../core/widgets/loading/loading_widget.dart';
import '../../../sqflite/database_helper.dart';
import '../../detail_pengiriman/page/detail_pengiriman.dart';
import 'history.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearch = false;
  bool _isLoading = false;
  final SearchHistoryDatabase _database = SearchHistoryDatabase();
  List<String> searchHistory = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadSearchHistory();
    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          _isSearch = false;
        } else {
          _isSearch = true;
        }
      });
    });
    _searchFocusNode.requestFocus();
  }

  void _loadSearchHistory() async {
    final history = await _database.getSearchHistory();
    setState(() {
      searchHistory = history.reversed.toList();
    });
  }

  void _saveSearchQuery() async {
    final query = _searchController.text;
    if (query.isNotEmpty && !searchHistory.contains(query)) {
      await _database.insertSearchQuery(query);
      _loadSearchHistory();
    }
  }

  Future<void> _searchCheck(String query) async {
    //get response
    setState(() {
      _isLoading = true;
    });
    try {
      var url = ('https://sistem.amanatkilatsemesta.com/api/track/$query');
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPengirimanPage(
              resi: query,
            ),
          ),
        );
      } else if (response.statusCode == 404) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Resi tidak ditemukan"),
              content: const Text("Silahkan coba lagi"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      } else {}
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Terjadi kesalahan"),
            content: const Text("Silahkan coba lagi"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _searchController.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: transparentAppBarWidget(),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: 250.w,
                        child: TextField(
                            onTap: () {
                              setState(() {});
                            },
                            controller: _searchController,
                            focusNode: _searchFocusNode,
                            decoration: InputDecoration(
                              prefixIconConstraints: const BoxConstraints(),
                              hintText: "Masukkan Nomor Resi",
                              hintStyle: textTheme.displayMedium?.copyWith(
                                  fontSize: 12.sp,
                                  color: const Color(0xff9B9B9B),
                                  fontWeight: FontWeight.w500),
                              fillColor: const Color(0xffF9F9F9),
                              focusColor: const Color(0xffF9F9F9),
                              filled: true,
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(
                                    left: 16.w,
                                    right: 16.w,
                                    top: 13.h,
                                    bottom: 13.h),
                                child: SvgPicture.asset(
                                  "assets/icons/search2.svg",
                                  height: 22.h,
                                  width: 22.w,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.5.r),
                                borderSide: BorderSide(
                                  color: const Color(0XFF9B9B9B).withOpacity(0),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.5.r),
                                borderSide: BorderSide(
                                  color: const Color(0XFF9B9B9B).withOpacity(0),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.5.r),
                                borderSide: BorderSide(
                                  color: const Color(0XFF9B9B9B).withOpacity(0),
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                            enableInteractiveSelection: true),
                      ),
                      InkWell(
                        onTap: () {
                          _saveSearchQuery();
                          if (_isSearch) {
                            //show loading and searchcheck when searchcheck clear loading off
                            _searchCheck(_searchController.text);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: SizedBox(
                          height: 50.h,
                          width: 50.w,
                          child: Center(
                            child: Text(
                              _isSearch ? "Cari" : "Batal",
                              style: textTheme.displayMedium?.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff9B9B9B),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Terkini",
                        style: textTheme.displayMedium?.copyWith(
                          fontSize: 14.sp,
                          color: const Color(0xff9B9B9B),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _database.deleteAllSearchHistory();
                          _loadSearchHistory();
                        },
                        child: SizedBox(
                          height: 24.h,
                          child: Center(
                            child: Text(
                              "Hapus",
                              style: textTheme.displayMedium?.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xff9B9B9B),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  ListView.builder(
                    itemCount: searchHistory.length >= 8 ? 8 : searchHistory.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              _searchCheck(searchHistory[index]);
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    "assets/icons/history.svg",
                                    height: 24.h,
                                    width: 24.w,
                                  ),
                                  SizedBox(width: 16.w),
                                  Text(
                                    searchHistory[index],
                                    style: textTheme.displayMedium?.copyWith(
                                      fontSize: 14.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          _searchController.text = searchHistory[index];
                                          _searchFocusNode.requestFocus();
                                        });
                                      },
                                      child: SvgPicture.asset(
                                        "assets/icons/arrow_outward.svg",
                                        height: 24.h,
                                        width: 24.w,
                                      )),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      );
                    },
                  ),
                  searchHistory.length > 8
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 8.h),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HistoryPage(),
                                    ));
                              },
                              child: Text(
                                "Lihat Semua",
                                style: textTheme.displayMedium?.copyWith(
                                  fontSize: 12.sp,
                                  color: const Color(0xff9B9B9B),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
          _isLoading ? const LoadingWidget() : Container()
        ],
      ),
    );
  }
}
