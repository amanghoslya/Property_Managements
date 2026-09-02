import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class PropertyStatusScreen extends StatefulWidget {
  const PropertyStatusScreen({super.key});

  @override
  State<PropertyStatusScreen> createState() => _PropertyStatusScreenState();
}

class _PropertyStatusScreenState extends State<PropertyStatusScreen> {
  final double progress = 0.62;
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
                    "Property Status",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff292832),
                      letterSpacing: -0.64,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    "CONSOLIDATED PROPERTY STATUS",
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
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
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 17.w,
                            vertical: 5.h,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.heading),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Row(
                            children: [
                              Container(
                                height: 7.h,
                                width: 7.h,
                                decoration: BoxDecoration(
                                  color: AppColors.heading,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                "Good",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.heading,
                                  fontSize: 13.sp,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Divider(color: Color.fromRGBO(42, 41, 51, 0.6)),
                    SizedBox(height: 10.h),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.heading),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "86",
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w500,
                                color: AppColors.heading,
                                fontSize: 16.sp,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Property Status",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.heading,
                                  fontSize: 16.sp,
                                  letterSpacing: -0.2,
                                ),
                              ),

                              SizedBox(height: 3.h),

                              Text(
                                "Your property is currently in good condition. There are some ongoing activities that need attention.",
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromRGBO(42, 41, 51, 0.6),
                                  fontSize: 13.sp,
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: progress.clamp(0.0, 1.0),
                        minHeight: 3.h,
                        backgroundColor: const Color(0xff919191),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF101C16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    "Current Status",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 16.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 13.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 21.w,
                mainAxisSpacing: 17.h,
                childAspectRatio: 2.08,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _infoCard(
                    icon: Icons.priority_high,
                    value: "2",
                    title: "Pending Issues",
                  ),

                  _infoCard(
                    icon: Icons.arrow_forward,
                    value: "1",
                    title: "Open Service Requests",
                  ),

                  _infoCard(
                    icon: Icons.access_time,
                    value: "15 Aug",
                    title: "Recent Inspection",
                  ),

                  _infoCard(
                    icon: Icons.check,
                    value: "3",
                    title: "Completed Work",
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    "Maintenance Activities",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 16.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "See All",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 13.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 17.h),
                decoration: BoxDecoration(
                  color: const Color(0xffFFFDF0),
                  border: Border.all(
                    color: const Color(0xff999999),
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(18.r),
                ),
                child: Column(
                  children: [
                    _auditItem(
                      icon: "✓",
                      title: "Bathroom maintenance updated",
                      description: "Plumbing repair is currently in progress.",
                    ),

                    SizedBox(height: 12.h),

                    // Divider
                    Container(
                      width: double.infinity,
                      height: 1.h,
                      color: const Color(0xff202820),
                    ),

                    SizedBox(height: 12.h),
                    _auditItem(
                      icon: "✓",
                      title: "AC maintenance completed",
                      description: "Scheduled maintenance work completed.",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    "Important Property Issues",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 16.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 13.sp,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String value,
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.only(left: 16.w, top: 9.h, right: 10.w, bottom: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF171717), width: 1),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, size: 15.sp, color: AppColors.heading),

          Text(
            value,
            style: GoogleFonts.outfit(
              fontSize: 17.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.heading,
            ),
          ),

          Text(
            title,
            style: GoogleFonts.outfit(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF777777),
            ),
          ),
        ],
      ),
    );
  }

  Widget _auditItem({
    required String icon,
    required String title,
    required String description,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 36.w,
          height: 36.h,
          decoration: BoxDecoration(
            color: Color.fromRGBO(16, 28, 22, 0.2),
            borderRadius: BorderRadius.circular(3.r),
          ),
          alignment: Alignment.center,
          child: Text(
            icon,
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.heading,
            ),
          ),
        ),

        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  letterSpacing: -0.2,
                ),
              ),

              SizedBox(height: 4.h),
              Text(
                description,
                style: GoogleFonts.outfit(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(42, 41, 51, 0.5),
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
        Text(
          "2h",
          style: GoogleFonts.outfit(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(42, 41, 51, 0.5),
            letterSpacing: -0.2,
          ),
        ),
      ],
    );
  }
}
