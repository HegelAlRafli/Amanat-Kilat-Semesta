import 'package:amanat_kilat_semesta/features/detail_pengiriman/detail_pengiriman.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  bool _isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController.addListener(() {
      setState(() {
        // if textfield is empty
        if (_searchController.text.isEmpty) {
          _isSearch = false;
        } else {
          _isSearch = true;
        }
      });
    });
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    _searchController.removeListener(() { });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50.h,
                    width: 250.w,
                    child: TextField(
                      onTap: () {
                        setState(() {
                          // if textfield is empty
                        });
                      },
                      controller: _searchController,
                      focusNode: _searchFocusNode,
                      decoration: InputDecoration(
                        prefixIconConstraints: const BoxConstraints(),
                        hintText: "Masukkan Nomer Resi",
                        hintStyle: textTheme.bodyText2?.copyWith(
                            fontSize: 12.sp,
                            color: const Color(0xff9B9B9B),
                            fontWeight: FontWeight.w500),
                        fillColor: const Color(0xffF9F9F9),
                        focusColor: const Color(0xffF9F9F9),
                        filled: true,
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 13.h, bottom: 13.h),
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
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_isSearch) {
                        _searchController.clear();
                        _searchFocusNode.unfocus();
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPengirimanPage(),));
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: Text(_isSearch? "Search": "Cancel", style: textTheme.bodyText2?.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xff9B9B9B),
                      fontWeight: FontWeight.w500,
                    ),),
                  )
                ],
              ),
              SizedBox(height: 16.h),
              Text("Terkini",
                style: textTheme.bodyText2?.copyWith(
                  fontSize: 14.sp,
                  color: const Color(0xff9B9B9B),
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.h),
              ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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

                        setState(() {
                          _searchFocusNode.unfocus();
                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailPengirimanPage(),));
                      },
                      child: Text("J092HDUE03DJIJ32",
                      style: textTheme.bodyText2?.copyWith(
                        fontSize: 14.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),),
                    ),
                    const Spacer(),
                    InkWell(
                        onTap: () {
                          setState(() {
                            _searchController.text = "J092HDUE03DJIJ32";
                            _searchFocusNode.requestFocus();
                          });
                        },
                        child: SvgPicture.asset("assets/icons/arrow_outward.svg", height: 24.h, width: 24.w,)),
                  ],),
                );
              },)
            ],
          ),
        ),
      ),
    );
  }
}
