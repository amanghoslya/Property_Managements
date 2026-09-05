import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class PropertyPerformanceScreen extends StatefulWidget {
  const PropertyPerformanceScreen({super.key});

  @override
  State<PropertyPerformanceScreen> createState() =>
      _PropertyPerformanceScreenState();
}

class _PropertyPerformanceScreenState extends State<PropertyPerformanceScreen> {
  final double progress = 0.90;
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
                    "Property Performance",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "View your property's overall performance",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
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
                          "Property",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(42, 41, 51, 0.5),
                            fontSize: 13.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          "Apartment A-204",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading,
                            fontSize: 18.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                        Text(
                          "Green Valley Residency",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(42, 41, 51, 0.5),
                            fontSize: 13.sp,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.heading),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        "Active",
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          color: AppColors.heading,
                          fontSize: 18.sp,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23.h),
              propertyScoreCard(),
              SizedBox(height: 21.h),
              Row(
                children: [
                  Text(
                    "Performance Breakdown",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Current",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 16.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    _progressItem(
                      title: "Inspection Performance",
                      percentage: 92,
                    ),

                    SizedBox(height: 10.h),

                    _progressItem(
                      title: "Maintenance Performance",
                      percentage: 88,
                    ),

                    SizedBox(height: 10.h),

                    _progressItem(
                      title: "Service Request Resolution",
                      percentage: 84,
                    ),

                    SizedBox(height: 10.h),

                    _progressItem(
                      title: "Complaint Resolution",
                      percentage: 80,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 13.h),
              Text(
                "Performance Summary",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 18.sp,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: _summaryCard(title: "Inspections", value: "12"),
                  ),

                  SizedBox(width: 20.w),

                  Expanded(
                    child: _summaryCard(title: "Maintenance", value: "18"),
                  ),
                ],
              ),

              SizedBox(height: 10.h),

              Row(
                children: [
                  Expanded(
                    child: _summaryCard(
                      title: "Services Resolved",
                      value: "09",
                    ),
                  ),

                  SizedBox(width: 20.w),

                  Expanded(
                    child: _summaryCard(title: "Open Issues", value: "02"),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Score Trend",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Last 6 Months",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 16.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading, width: 1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Property Score",
                          style: GoogleFonts.outfit(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF101C16),
                          ),
                        ),
                        Text(
                          "+8% improvement",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF101C16),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 15.h),
                    SizedBox(
                      height: 125.h,
                      child: Column(
                        children: [
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                _scoreBar("March", 65),
                                _scoreBar("Apr", 76),
                                _scoreBar("May", 94),
                                _scoreBar("Jun", 76),
                                _scoreBar("Jul", 61),
                                _scoreBar("Aug", 85),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Performance Insight",
                style: GoogleFonts.outfit(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF101C16),
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading, width: 1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Area to Improve",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF101C16),
                        letterSpacing: -0.2,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Complaint resolution performance can be improved. Two issues are currently open. Resolving pending issues may help improve the overall property score.",
                      style: GoogleFonts.outfit(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF101C16),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget propertyScoreCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF101C16), width: 1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        children: [
          Text(
            "Overall Property Score",
            style: GoogleFonts.outfit(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF101C16),
              letterSpacing: -0.2,
            ),
          ),

          SizedBox(height: 8.h),
          SizedBox(
            height: 100.w,
            width: 100.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 100.w,
                  width: 100.w,
                  child: CircularProgressIndicator(
                    value: 0.90,
                    strokeWidth: 2,
                    backgroundColor: AppColors.heading,
                    valueColor: const AlwaysStoppedAnimation<Color>(
                      Color(0xFFC28A20),
                    ),
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "86",
                      style: GoogleFonts.outfit(
                        fontSize: 40.sp,
                        height: 0.9,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF101C16),
                      ),
                    ),
                    Text(
                      "/100",
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF101C16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF101C16), width: 1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              "Good Performance",
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF101C16),
              ),
            ),
          ),

          SizedBox(height: 10.h),

          Text(
            "Last updated: 18 Aug 2026",
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff2A2933),
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressItem({required String title, required int percentage}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF101C16),
                letterSpacing: -0.3,
              ),
            ),

            Text(
              '$percentage%',
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF101C16),
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),

        SizedBox(height: 5.h),

        ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: LinearProgressIndicator(
            value: percentage / 100,
            minHeight: 4.h,
            backgroundColor: const Color(0xff919191),
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF101C16)),
          ),
        ),
      ],
    );
  }

  Widget _summaryCard({required String title, required String value}) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.heading, width: 1),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 25.h,
            width: 25.w,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.heading, width: 1),
              borderRadius: BorderRadius.circular(4.r),
            ),
            alignment: Alignment.center,
            child: Icon(Icons.check, size: 16.sp, color: AppColors.heading),
          ),

          SizedBox(height: 4.h),

          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF101C16),
              letterSpacing: -0.2,
            ),
          ),

          SizedBox(height: 4.h),

          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF101C16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scoreBar(String month, double barHeight) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: barHeight.h,
                width: 14.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.r),
                    topRight: Radius.circular(7.r),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 2.h,
            width: double.infinity,
            color: const Color(0xFF999999),
          ),

          SizedBox(height: 4.h),

          Text(
            month,
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF101C16),
            ),
          ),
        ],
      ),
    );
  }
}
