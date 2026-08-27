import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';
import 'package:property_care/document_details_screen/document_details_screen.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  int selectedFilter = 0;

  final List<String> filters = [
    "All",
    "Property",
    "Inspection",
    "Audit",
    "Certificates",
    "Maintenance",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: AppColors.background,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "PROPERTY DOCUMENTS",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),

                  SizedBox(height: 2.h),

                  Text(
                    "ALL PROPERTY RECORDS IN ONE PLACE",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(42, 41, 51, 0.6),
                      letterSpacing: -0.24,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 13.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: const Color(0xff101C16), width: 1),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/document_img.png",
                            width: double.infinity,
                            height: 151.h,
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            left: 12.w,
                            top: 10.h,
                            child: Container(
                              width: 72.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                color: Color(0xff101C16),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  "A-204",
                                  style: GoogleFonts.outfit(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 13.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Apartment A-204",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff101C16),
                                letterSpacing: -0.54,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "Green Valley Residency · Jaipur",
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(42, 41, 51, 0.6),
                                letterSpacing: -0.34,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "05",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff101C16),
                                letterSpacing: -0.54,
                              ),
                            ),
                            // SizedBox(height: 5.h),
                            Text(
                              "Documents",
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                color: Color(0xff101C16),
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.34,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 23.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 55.h,
                width: double.infinity,
                padding: EdgeInsets.only(left: 16.w, right: 10.w),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFDF2),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Color(0xff101C16), width: 1),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 25.sp,
                      color: const Color(0xff8B8D8B),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Search documents...",
                          hintStyle: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff8B8D8B),
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 17.h),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(filters.length, (index) {
                    final bool isSelected = selectedFilter == index;

                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedFilter = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          // height: 27.h,
                          padding: EdgeInsets.symmetric(
                            vertical: 5.h,
                            horizontal: 13.w,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xff101C16)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(40.r),
                            border: Border.all(
                              color: const Color(0xff101C16),
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            filters[index],
                            style: GoogleFonts.outfit(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xff101C16),
                              letterSpacing: -0.3,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                children: [
                  Text(
                    "Recent Documents",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff101C16),
                      fontSize: 16.sp,
                      letterSpacing: -0.54,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "5 Files",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff101C16),
                      fontSize: 12.sp,
                      letterSpacing: -0.24,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => DocumentDetailsScreen(),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10.h),
                      padding: EdgeInsets.symmetric(
                        vertical: 13.w,
                        horizontal: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: Color.fromRGBO(16, 28, 22, 0.6),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.r),
                              border: Border.all(color: Color(0xff101C16)),
                            ),
                            child: Center(
                              child: Image.asset(
                                "assets/document1_img.png",
                                width: 21.w,
                                height: 21.h,
                              ),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Property Ownership Document",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Color(0xff101C16),
                                  letterSpacing: -0.54,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "PDF · 2.4 MB · 10 Aug 2026",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.sp,
                                  color: Color.fromRGBO(42, 41, 51, 0.6),
                                  letterSpacing: -0.24,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                "PROPERTY DOCUMENT",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: Color(0xff2A2933),
                                  letterSpacing: -0.24,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            height: 36.w,
                            width: 36.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff101C16)),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Color(0xff101C16),
                                size: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xffEAE7DA),
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: const Color(0xff26332D),
                    width: 1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Property Document Storage",
                          style: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff101C16),
                            letterSpacing: -0.34,
                          ),
                        ),

                        const Spacer(),

                        Text(
                          "8.4 MB / 25 MB",
                          style: GoogleFonts.outfit(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(0, 0, 0, 0.6),
                            letterSpacing: -0.3,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18.h),
                    Container(
                      width: double.infinity,
                      height: 4.h,
                      decoration: BoxDecoration(
                        color: const Color(0xff999B93),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 16 / 25,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff17221D),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 35.h),
          ],
        ),
      ),
    );
  }
}
