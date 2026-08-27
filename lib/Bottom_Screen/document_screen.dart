import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: Container(
          color: AppColors.scaffoldBg,
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
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(
          children: [
            Container(
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
          ],
        ),
      ),
    );
  }
}
