import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class DocumentDetailsScreen extends StatefulWidget {
  const DocumentDetailsScreen({super.key});

  @override
  State<DocumentDetailsScreen> createState() => _DocumentDetailsScreenState();
}

class _DocumentDetailsScreenState extends State<DocumentDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Container(
          color: AppColors.background,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 41.h,
                      width: 41.w,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromRGBO(16, 28, 22, 0.3),
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: Color(0xff101C16),
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Document Details",
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
                        "DOCUMENT PREVIEW",
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
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Text(
                "Document Preview",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.heading,
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5.h),
                decoration: BoxDecoration(
                  color: Color(0xffD7D4C8),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.heading),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/image_details.png",
                    width: 269.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Property Overview",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColors.heading,
                  letterSpacing: -0.54,
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    _documentRow(
                      title: "Document Name",
                      value: "Property Ownership Document",
                    ),
                    _documentRow(title: "Category", value: "Property Document"),
                    _documentRow(title: "File Type", value: "PDF"),
                    _documentRow(title: "File Size", value: "2.4 MB"),
                    _documentRow(title: "Uploaded On", value: "10 August 2026"),
                    _documentRow(
                      title: "Document Status",
                      value: "Verified",
                      valueColor: const Color(0xFF24B56B),
                      showBottomBorder: false,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Description",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  fontSize: 16.sp,
                  letterSpacing: -0.54,
                ),
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 9.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.heading),
                ),
                child: Center(
                  child: Text(
                    "Official property ownership document associated with Apartment A-204. This document is available for viewing and download from the property document repository.",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(42, 41, 51, 0.6),
                      fontSize: 13.sp,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.w),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 41.h,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: AppColors.heading, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                        icon: Icon(
                          Icons.reply_outlined,
                          size: 19.sp,
                          color: AppColors.heading,
                        ),
                        label: Text(
                          "Share",
                          style: GoogleFonts.outfit(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.heading,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 24.w),

                  Expanded(
                    child: SizedBox(
                      height: 41.h,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.heading,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                        ),
                        icon: Icon(
                          Icons.download_outlined,
                          size: 19.sp,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Download Document",
                          style: GoogleFonts.outfit(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            letterSpacing: -0.24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _documentRow({
    required String title,
    required String value,
    Color valueColor = const Color(0xFF171A18),
    bool showBottomBorder = true,
  }) {
    return SizedBox(
      height: 54.h,
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                border: showBottomBorder
                    ? const Border(
                        bottom: BorderSide(color: Color(0xFFC8C8C1), width: 1),
                      )
                    : null,
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.outfit(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(42, 41, 51, 0.6),
                  letterSpacing: -0.24,
                ),
              ),
            ),
          ),
          Container(
            height: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              border: showBottomBorder
                  ? const Border(
                      bottom: BorderSide(color: Color(0xFFC8C8C1), width: 1),
                    )
                  : null,
            ),
            alignment: Alignment.centerRight,
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: GoogleFonts.outfit(
                fontSize: 13.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.heading,
                letterSpacing: -0.24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
