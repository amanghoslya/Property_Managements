import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class AuditreprotScreen extends StatefulWidget {
  const AuditreprotScreen({super.key});

  @override
  State<AuditreprotScreen> createState() => _AuditreprotScreenState();
}

class _AuditreprotScreenState extends State<AuditreprotScreen> {
  int selectedFilter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        automaticallyImplyLeading: false,
        titleSpacing: 20.w,
        title: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 41.w,
                  height: 41.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(16, 28, 22, 0.3),
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: const Color(0xff101C16),
                    size: 16.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Audit Reports",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "AUDIT REPORT HISTORY",
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 13.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.heading),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(color: AppColors.heading),
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/auditImg.png",
                        height: 18.h,
                        width: 18.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apartment A-204",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                          letterSpacing: -0.2,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Green Valley Residency · Jaipur",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(42, 41, 51, 0.5),
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Audit Reports",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.heading,
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "View previous audit reports, audit dates, findings and\n recommendations.",
              style: GoogleFonts.outfit(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(42, 41, 51, 0.5),
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Expanded(
                  child: _reportFilterButton(
                    title: "All Reports",
                    isSelected: selectedFilter == 0,
                    onTap: () {
                      setState(() {
                        selectedFilter = 0;
                      });
                    },
                  ),
                ),

                SizedBox(width: 20.w),

                Expanded(
                  child: _reportFilterButton(
                    title: "Recent",
                    isSelected: selectedFilter == 1,
                    onTap: () {
                      setState(() {
                        selectedFilter = 1;
                      });
                    },
                  ),
                ),

                SizedBox(width: 15.w),

                Expanded(
                  child: _reportFilterButton(
                    title: "Previous",
                    isSelected: selectedFilter == 2,
                    onTap: () {
                      setState(() {
                        selectedFilter = 2;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 15.h,
                  ),
                  margin: EdgeInsets.only(bottom: 20.h),
                  decoration: BoxDecoration(
                    color: const Color(0xffFFFDF0),
                    border: Border.all(
                      color: const Color(0xff101C16),
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(13.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 49.w,
                            height: 51.h,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff101C16),
                                width: 1.1,
                              ),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.article_outlined,
                                size: 22.sp,
                                color: const Color(0xff101C16),
                              ),
                            ),
                          ),

                          SizedBox(width: 14.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Property Audit Report",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff101C16),
                                    letterSpacing: -0.2,
                                  ),
                                ),

                                SizedBox(height: 7.h),

                                Text(
                                  "12 August 2026",
                                  style: GoogleFonts.outfit(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(16, 28, 22, 0.6),
                                    letterSpacing: -0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(width: 10.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 5.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff101C16),
                              ),
                              borderRadius: BorderRadius.circular(25.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "Completed",
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff101C16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      Divider(
                        height: 1,
                        thickness: 1,
                        color: const Color(0xff777970),
                      ),

                      SizedBox(height: 17.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _infoItem(
                              title: "AUDIT TYPE",
                              value: "Property Audit",
                            ),
                          ),

                          SizedBox(width: 15.w),

                          Expanded(
                            child: _infoItem(
                              title: "AUDIT DATE",
                              value: "12 Aug 2026",
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _infoItem(
                              title: "REPORT STATUS",
                              value: "Completed",
                            ),
                          ),

                          SizedBox(width: 15.w),

                          Expanded(
                            child: _infoItem(
                              title: "FINDINGS",
                              value: "Available",
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 14.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Findings & recommendations available",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              "View Report →",
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportFilterButton({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 7.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: isSelected
                ? const Color(0xff101C16)
                : const Color(0xff8B8D84),
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(25.r),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 13.sp,
            fontWeight: FontWeight.w400,
            color: isSelected
                ? const Color(0xff101C16)
                : const Color(0xff777970),
            letterSpacing: -0.2,
          ),
        ),
      ),
    );
  }

  Widget _infoItem({required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(16, 28, 22, 0.6),
            letterSpacing: -0.2,
          ),
        ),

        SizedBox(height: 2.h),

        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.outfit(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.heading,
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
