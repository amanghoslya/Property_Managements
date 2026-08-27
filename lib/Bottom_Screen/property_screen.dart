import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:property_care/core/constant/appColor.dart';

class PropertyScreen extends StatefulWidget {
  const PropertyScreen({super.key});

  @override
  State<PropertyScreen> createState() => _PropertyScreenState();
}

class _PropertyScreenState extends State<PropertyScreen> {
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
                    "PROPERTY DETAILS",
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
                    "Complete information about your property",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Image.asset(
                      "assets/property_img (2).png",
                      width: double.infinity,
                      height: 183.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xff101C16).withOpacity(0.0),
                            Color(0xff101C16).withOpacity(0.0),
                            Color(0xff101C16),
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 16.w,
                    bottom: 17.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "My Property",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                            fontSize: 11.sp,
                            letterSpacing: -0.24,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Apartment A-204",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color(0xffFFFFFF),
                            fontSize: 18.sp,
                            letterSpacing: -0.54,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          "Green Valley Residency · Jaipur",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                            fontSize: 13.sp,
                            letterSpacing: -0.34,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    "Property Overview",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 16.sp,
                      letterSpacing: -0.34,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "View All",
                    style: GoogleFonts.outfit(
                      fontWeight: FontWeight.w500,
                      color: AppColors.heading,
                      fontSize: 13.sp,
                      letterSpacing: -0.34,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children: [
                    _documentRow(title: "Property Number", value: "A-204"),
                    _documentRow(title: "Property Type", value: "Apartment"),
                    _documentRow(title: "Area", value: "1,250 sq.ft"),
                    _documentRow(title: "Location", value: "Jaipur, Rajasthan"),
                    _documentRow(title: "Property Status", value: "Good"),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                "Property Information",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w500,
                  color: AppColors.heading,
                  fontSize: 16.sp,
                  letterSpacing: -0.34,
                ),
              ),
              SizedBox(height: 18.h),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 28.w,
                mainAxisSpacing: 22.h,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                childAspectRatio: 1.75,
                children: [
                  _infoCard(
                    icon: Icons.home_outlined,
                    title: "Green Valley Residency",
                    subtitle: "Associated Complex",
                  ),

                  _infoCard(
                    icon: Icons.circle,
                    title: "Rahul Sharma",
                    subtitle: "Assigned Caretaker",
                    iconSize: 19,
                  ),

                  _infoCard(
                    icon: Icons.access_time_outlined,
                    title: "15 Aug",
                    subtitle: "Last Inspection",
                  ),

                  _infoCard(
                    icon: Icons.crop_square,
                    title: "5",
                    subtitle: "Documents",
                    iconSize: 20,
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFDF1),
                  border: Border.all(color: AppColors.heading),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 35.h,
                      width: 37.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF30342E)),
                        borderRadius: BorderRadius.circular(3.r),
                      ),
                      child: Center(
                        child: Container(
                          height: 17.h,
                          width: 17.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.heading),
                          ),
                          child: Center(
                            child: Container(
                              height: 12.h,
                              width: 12.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.heading,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Property Status",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                              letterSpacing: -0.34,
                            ),
                          ),

                          SizedBox(height: 7.h),
                          Text(
                            "View overall property condition",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.inter(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(41, 42, 51, 0.6),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 15.w),
                    Container(
                      height: 34.h,
                      width: 32.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.heading),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.chevron_right,
                          size: 16.sp,
                          color: AppColors.heading,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.only(
                  left: 10.w,
                  top: 15.h,
                  bottom: 15.w,
                  right: 10.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColors.heading),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        height: 42.h,
                        width: 42.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.heading,
                            width: 1.5,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            "86",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Property Score",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: AppColors.heading,
                              fontSize: 16.sp,
                              letterSpacing: -0.34,
                            ),
                          ),
                          Text(
                            "Overall property performance based on maintenance,\n cleanliness, security and inspections.",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(42, 41, 51, 0.6),
                              fontSize: 16.sp,
                              letterSpacing: -0.34,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 9.h),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(42, 41, 51, 0.2)),
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current Care Package",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: Color.fromRGBO(42, 41, 51, 0.5),
                            fontSize: 13.sp,
                            letterSpacing: -0.34,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Premium Care",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading,
                            fontSize: 16.sp,
                            letterSpacing: -0.34,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25.w,
                        vertical: 7.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.heading),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: Text(
                          "ACTIVE",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            color: AppColors.heading,
                            fontSize: 13.sp,
                            letterSpacing: -0.24,
                          ),
                        ),
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

  Widget _documentRow({
    required String title,
    required String value,
    // Color valueColor = const Color(0xFF171A18),
    bool showBottomBorder = true,
  }) {
    return SizedBox(
      height: 40.h,
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

  Widget _infoCard({
    required IconData icon,
    required String title,
    required String subtitle,
    double iconSize = 20,
  }) {
    return Container(
      padding: EdgeInsets.only(
        left: 15.w,
        right: 12.w,
        top: 10.h,
        bottom: 10.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF1),
        border: Border.all(color: AppColors.heading),
        borderRadius: BorderRadius.circular(11.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: iconSize.sp, color: AppColors.heading),

          SizedBox(height: 8.h),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.heading,
              letterSpacing: -0.54,
            ),
          ),

          SizedBox(height: 8.h),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(41, 42, 51, 0.6),
              letterSpacing: -0.34,
            ),
          ),
        ],
      ),
    );
  }
}
